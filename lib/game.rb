require "pry"
class Game
attr_accessor :board ,:player_1, :player_2

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
   def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)#binding.pry
     @board = []
     @player_1 = player_1
     @player_2 = player_2
     @board = board
   end

   def current_player
     #binding.pry
     board.turn_count % 2 == 0 ? player_1 : player_2
   end

   def over?
     board.full?
   end

   def won?
     WIN_COMBINATIONS.any? do |num_array|
       board.cells[num_array[0]] == board.cells[num_array[1]] && board.cells[num_array[1]] == board.cells[num_array[2]]
     end
   end

   def draw?
     if won?
       false
     elsif board.full?
       true
     end
    end

    def winner
      player = WIN_COMBINATIONS.detect do |num_array|
        board.cells[num_array[0]] != " " &&
        board.cells[num_array[0]] ==  board.cells[num_array[1]] && board.cells[num_array[1]] == board.cells[num_array[2]]
      end
      player == nil ? nil : board.cells[player.first]
    end

    def turn
    #  binding.pry
      mv = current_player.move(current_player.token)
      turn if not board.valid_move?(mv)
      board.update(mv, current_player)
    end

    def play
    end


end
