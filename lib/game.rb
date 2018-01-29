class Game < Board
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

  def call
    puts "Welcome to Tic Tac Toe!"
    start
  end

  def start
    game = Game.new
    puts "How many players wish to play?"
    puts "0, 1, 2"

    input = gets.strip
      case input
        when "0"
          Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
        when "1"
          Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
        when "2"
          Game.new(Players::Human.new("X"), Players::Human.new("O")).play
        end
        rematch
      end

  def rematch
    puts "Would you like to play again?"
    puts "y/n"
      play_again = ""
      play_again = gets.strip
        case play_again
        when "y"
          start
        when "n"
          puts "Thanks for playing!"
        end
  end

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
     @board = board
     @player_1 = player_1
     @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def draw?
    @board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
     @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
     @board.taken?(combo[0]+1)
    end
  end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}"
       @board.display
        @board.update(current_move, player)
          puts "#{player.token} moved #{current_move}"
         @board.display
     end
  end


def play
  until over?
    turn
  end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      1.times do
        puts "Cat's Game!"
      end
    end
  end
end
