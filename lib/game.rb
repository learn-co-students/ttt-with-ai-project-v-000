require 'colorize'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      (@board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O") &&
       @board.cells[combo[0]] == @board.cells[combo[1]] &&
       @board.cells[combo[1]] == @board.cells[combo[2]]
     end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    !won? ? nil : board.cells[won?.first]
  end

  def turn
    player = current_player
    new_move = player.move(@board)
    if !@board.valid_move?(new_move)
      puts "\nInvalid input.. please try again.".red
      @board.display(board)
      turn
    else
      @board.update(new_move, player)
      @board.display(board)
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!".green
    elsif draw?
      puts "Cats Game!".red
    end
  end

  def play_cli
    turn until over?
    puts "Cats Game!" if draw?
    puts "Congratulations #{winner}!".colorize(:color => :green).bold unless draw?
    puts "Would you like to play again? Yes or No".colorize(:color => :red).bold
    input = gets.chomp.downcase
    case input
    when "yes", "y"
      return
    when "no", "n"
      puts "Thanks for playing. Goodbye."
      exit
    else
      puts "Thanks for playing. Goodbye."
      exit
    end
  end

end
