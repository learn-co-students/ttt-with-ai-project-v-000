require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
      [2,5,8],
      [0,1,2],
      [6,7,8],
      [3,4,5],
      [0,3,6],
      [1,4,7],
      [0,4,8],
      [2,4,6]
    ]
    @@x_wins = 0
    @@o_wins = 0
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end
  def over?
      won? || draw?
  end
  def won?
    WIN_COMBINATIONS.detect do |win_array|
     @board.cells[win_array[0]] == @board.cells[win_array[1]] &&
     @board.cells[win_array[1]] == @board.cells[win_array[2]] &&
     @board.cells[win_array[0]] != " "
    end
  end
  def draw?
    !won? && @board.full?
  end
 def winner
   won? ? @board.cells[won?.first] : nil
 end
 def winner_counter
   counter = 0
   if won?
     counter += 1
   else
     puts "no winner"
   end
   counter
 end
 def turn
   puts "Please enter 1-9:"
   input = current_player.move(@board)
   if @board.valid_move?(input) == true
     @board.update(input, current_player)
   else
     turn
   end
   @board.display
  end
  def play
    until over? || draw?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
      self
    end
  end
  def score_tracking
    if winner == "X"
      @@x_wins += 1
    else winner == "O"
      @@o_wins += 1
    end
    puts "X wins: #{@@x_wins}, O wins: #{@@o_wins}"
    self
  end
 end
