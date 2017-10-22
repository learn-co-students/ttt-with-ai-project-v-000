require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def winning_player
    if @board.turn_count % 2 == 0
      player_2
    else
      player_1
    end
  end


  WIN_COMBINATIONS = [
   [0,1,2], # " #board[0] | #board[1] | #board[2] "
   [3,4,5], # horizontal win
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2]
   ]

   def over?
     won? || draw?
   end



  def won?
     WIN_COMBINATIONS.find { |w_c| @board.cells[w_c[0]] == @board.cells[w_c[1]] && @board.cells[w_c[1]] == @board.cells[w_c[2]] && @board.cells[w_c[0]] != " " }
  end

   def draw?
     !won? && @board.full?
   end

   def winner
     winning_combo = won?
     if won?
       @board.cells[winning_combo[0]]
     end
   end



   def turn
     player = current_player
     current_move = player.move(@board)
     if @board.valid_move?(current_move) == false
       turn
     else
       @board.display
       @board.update(current_move, player)
       @board.display
     end
   end

   def play
      while !over?
        turn
      end
      if won?
        game_winner = winner
        puts "Congratulations #{game_winner}!"
      elsif @board.full?
        puts "Cat's Game!"
      elsif draw?
        puts "Cat's game!"
      end
end

end
