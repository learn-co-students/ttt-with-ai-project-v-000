require "pry"
class Game

   attr_accessor :board, :player_1, :player_2


    WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
   end

  def over?
     won? || draw?
  end

  def won?
     WIN_COMBINATIONS.detect do | win_combination |
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]

     position_1 = @board.cells[win_index_1]
     position_2 = @board.cells[win_index_2]
     position_3 = @board.cells[win_index_3]

     if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win_combination
     else
       false
     end
    end
    false
   end

   def draw?
     !won? && board.full?
   end

   def winner
     if win_combo = won?
       @board.cells[win_combo.first]
     end
   end

   def turn
     #binding.pry
    move = current_player.move(board)
    if !board.valid_move?(move)
      turn
    else
      board.update(move, current_player)
    end
   end

   def play
     turn until over?
     puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
   end


end
