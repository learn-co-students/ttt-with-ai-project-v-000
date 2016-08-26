class Game
attr_accessor :board ,:player_1, :player_2

def self.win_comb
  WIN_COMBINATIONS
end


  WIN_COMBINATIONS =[
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
     @player_1 = player_1
     @player_2 = player_2
     @board = board
   end

   def current_player
     board.turn_count % 2 == 0 ? player_1 : player_2
   end

   def over?
      won? || draw?
   end

   def won?
     WIN_COMBINATIONS.any? do |num_array|
       board.cells[num_array[0]] != " " &&
       board.cells[num_array[0]] == board.cells[num_array[1]] && board.cells[num_array[1]] == board.cells[num_array[2]]
     end
   end

   def draw?
      !won? && board.full?
   end

    def winner
      player = WIN_COMBINATIONS.detect do |num_array|
        board.cells[num_array[0]] != " " &&
        board.cells[num_array[0]] ==  board.cells[num_array[1]] && board.cells[num_array[1]] == board.cells[num_array[2]]
      end
      player == nil ? nil : board.cells[player.first]
    end

    def turn
<<<<<<< HEAD
=======
      #binding.pry
>>>>>>> 6250d7fb7ef3a37983e9197f6d720f12b3c43803
      mv = " "
      until board.valid_move?(mv)
        mv = current_player.move(board)
      end
      board.update(mv, current_player)
    end

    def play
      until over?
        turn
        board.display
      end
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cats Game!"
      end
    end






end
