require 'pry'
module Players

  class Computer < Player

    def move(board)
      valid_moves = Board.new.cells.map.with_index(1) do |v, i|
        if v == " "
          i.to_s
        end
      end
      valid_moves.sample.to_s
      # valid_moves.find{|move|@board.cells[move] == " "}.to_s
      binding.pry
    end
  end
end
    #////////////AS PLAYER_1//////////////////////
    def corner_move(board)
      #first move
      first_move = [1,3,7,9].sample.to_s
      first_move
    end

    def opposite_corner(board)
      #second move
     if @board.position(1) == self.token
       "9"
     elsif @board.position(3) == self.token
       "7"
     elsif @board.position(7) == self.token
       "3"
     elsif @board.position(9) == self.token
       "1"
     end
   end
   #<<<<<<<<<<<block_move>>>>>>>>>>>>>>
   def center_move(board)
     if !@board.taken?(5)
       "5"
     end
   end
   #<<<<<<<<<<<block_move>>>>>>>>>>>>>>
   def edge_move(board)
     #possibly third move
     if !@board.taken(3) && !@board.taken(7)
       #if 3 and 7 are available choose 1
       third_move = [3,7].sample.to_s
       third_move
     elsif @board.taken(3)
      #if 3 is taken move to 7
       "7"
     elsif @board.taken(7)
       #if 7 is taken move to 3
       "3"
     end
   end
   #<<<<<<<<<<<block_move>>>>>>>>>>>>>>
   def fourth_move(board)
     WIN_COMBINATIONS.find do |d|
       d[0] = i_1
       d[1] = i_2
       d[2] = i_3
       i_1
       i_2
       i_3

   end
