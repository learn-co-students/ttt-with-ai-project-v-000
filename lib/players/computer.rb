require 'pry'
module Players

  class Computer < Player
    #////////////AS PLAYER_1//////////////////////
    def corner_move(board)
      #first move
      first_move = [1,3,7,9].sample.to_s
      first_move
    end

    def opposite_corner(board)
      #second move
     if board.position(1) == self.token
       "9"
     elsif board.position(3) == self.token
       "7"
     elsif board.position(7) == self.token
       "3"
     elsif board.position(9) == self.token
       "1"
     end
   end
   #<<<<<<<<<<<block_move>>>>>>>>>>>>>>
   def center_move(board)
     if !board.taken?(5)
       "5"
     end
   end
   #<<<<<<<<<<<block_move>>>>>>>>>>>>>>
   def edge_move(board)
     #possibly third move
     if !board.taken?(3) && !board.taken?(7)
       #if 3 and 7 are available choose 1
       third_move = [3,7].sample.to_s
       third_move
     elsif board.taken?(3)
      #if 3 is taken move to 7
       "7"
     elsif board.taken?(7)
       #if 7 is taken move to 3
       "3"
     end
   end
   #<<<<<<<<<<<block_move>>>>>>>>>>>>>>
   def win_move(board)
     win_1 = WIN_COMBINATIONS.detect do |combo|
    		       input_1 = combo[0]
    		       input_2 = combo[1]
    		       input_3 = combo[2]
    		       board[input_1] == "X" && board[input_2] == "X" && board[input_3] == " "
  	        end

     win_2 = WIN_COMBINATIONS.detect do |combo|
  			       input_1 = combo[0]
  			       input_2 = combo[1]
  			       input_3 = combo[2]
  			       board[input_2] == "X" && board[input_3] == "X" && board[input_1] == " "
  	        end
   	win_3 = WIN_COMBINATIONS.detect do |combo|
           	 input_1 = combo[0]
           	 input_2 = combo[1]
           	 input_3 = combo[2]
           	 board[input_1] == "X" && board[input_3] == "X" && board[input_2] == " "
           	end
       if win_1
            (win_1.detect{|i| board[i]==" "}+1).to_s
       elsif win_2
       	    (win_2.detect{|i| board[i]==" "}+1).to_s
       elsif win_3
       	    (win_3.detect{|i| board[i]==" "}+1).to_s
       end
    end
    def move(board)
        if board.turn_count == 0
          corner_move(board)
        elsif board.turn_count == 2
          opposite_corner(board)
        elsif board.turn_count == 4
          edge_move(board) || win_move(board)
        else
          valid_moves = board.cells.map.with_index(1) do |v, i|
              if v == " "
                i.to_s
              end
            end
          valid_moves.sample.to_s
        end
    end
  end
end
