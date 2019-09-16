require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
   [0, 1, 2],
   [3, 4, 5],
   [6, 7, 8],
   [0, 3, 6],
   [1, 4, 7],
   [2, 5, 8],
   [0, 4, 8],
   [2, 4, 6]]

   def initialize (player_1= Players::Human.new("X"), player_2= Players::Human.new("O"), board = Board.new)
     @player_1 = player_1
     @player_2 = player_2
     @board = board
   end

   def current_player
     board.turn_count.even? ? player_1 : player_2
   end

   def draw?
     !won? && board.full?
   end

   def over?
     draw? || won?
   end

   def won?
     WIN_COMBINATIONS.any? do |c|
       if
         board.cells[c[0]] == player_1.token &&
         board.cells[c[1]] == player_1.token &&
         board.cells[c[2]] == player_1.token ||
         board.cells[c[0]] == player_2.token &&
         board.cells[c[1]] == player_2.token &&
         board.cells[c[2]] == player_2.token
         return c
       end
     end
   end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    board.display
    turn_play = current_player.move(board)
    puts "It's #{current_player.token}'s move."
    if board.valid_move?(turn_play)
      board.update(turn_play, current_player)
    else
      puts "Sorry, that move is not valid. Please enter another position."
      turn
    end
  end

  def play
    puts "#{current_player}, choose a space from 1-9:"
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
end
