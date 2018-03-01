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
   [6,4,2],
   [0,4,8]
 ]


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end




    def current_player
      board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def over?
      draw? || won?
    end

    def won?
       WIN_COMBINATIONS.detect do |w|
        win_index_1 = w[0]
        win_index_2 = w[1]
        win_index_3 = w[2]
        board.cells[win_index_1] == board.cells[win_index_2] && board.cells[win_index_2] == board.cells[win_index_3] && board.taken?(win_index_1 + 1)


      end
    end


    def draw?
      board.full? && !won?
    end

    def winner
      if won?
        board.cells[won?[0]]
      end
    end

    def turn
      i = current_player.move(board)
      if board.valid_move?(i)
      board.update(i, current_player)
    else turn

      end
    end


    def play
      turn until over?
      if won?
         puts "Congratulations #{winner}!"

       elsif draw?
         puts "Cat's Game!"
     end
   end

end
