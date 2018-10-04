require 'pry'
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
    [2,4,6]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def start
    puts "How many players? Type 0, 1 or 2."
    players = gets.strip
    puts "Who wants to go first? Type 1 or 2."
    first = gets.strip

    if players == "0" && first == "1"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
      play
    elsif players == "0" && first == "2"
      @player_2 = Players::Computer.new("X")
      @player_1 = Players::Computer.new("O")
      play
    elsif players == "1" && first == "1"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Computer.new("O")
      puts "You are Player 1. The Computer is Player 2."
      play
    elsif players == "1" && first == "2"
      @player_2 = Players::Human.new("X")
      @player_1 = Players::Computer.new("O")
      play
    elsif players == "2" && first == "1"
      @player_1
      @player_2
      play
    elsif players == "2" && first == "2"
      @player_2 == Players::Human.new("O")
      @player_1 == Players::Human.new("X")
      play
    else
      puts "Can't compute. Try again."
      start
    end
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|

      position_1 = board.cells[win_combo[0]]
      position_2 = board.cells[win_combo[1]]
      position_3 = board.cells[win_combo[2]]

      position_1 == position_2 && position_2 == position_3 &&
      position_1 != " " ? true : false
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if win_combo = won?
      board.cells[win_combo[0]]
    end
  end

  def turn
    puts "#{current_player.token}, choose a space 1-9."
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      turn
    end
  end

  def again?
    puts "Would you like to play again? Y/N."
    play_again = gets.chomp
    if play_again == "Y" || play_again == "y"
      Game.new.start
    else
      puts "Goodbye!"
    end
  end



  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      again?
    elsif draw?
      puts "Cat's Game!"
      again?
    end
  end

end
