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
    
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end
  
  def won?
      WIN_COMBINATIONS.detect do |win_combo|
    position_1 = @board.cells[win_combo[0]]
    position_2 = @board.cells[win_combo[1]]
    position_3 = @board.cells[win_combo[2]]
    
    position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    end
  end
  
  def draw?
    @board.full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    won? && @board.cells[won?[0]]
  end
  
  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      puts "try again."
      turn
    end
  end
  
  def play
    board.display
    until over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
      start_again?
    else draw?
      puts "Cat's Game!"
      start_again?
    end
  end
  
   def start_again?
    puts "Would you like to play again? (Y/n)"
    answer = gets.strip
    if answer.downcase == "y"
      mode
    elsif answer.downcase == "n" || answer.downcase == "quit" || answer.downcase == "exit"
      system("clear")
      puts "GOODBYE!"
      gets
      exit!
    end
  end

end