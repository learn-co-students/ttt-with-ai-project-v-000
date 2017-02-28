require 'pry'
module Players

  class Computer < Player

#the code below works but does not pass the test.
#   	def move(board)
#       spot = nil
      
#         until board.valid_move?(spot)
#         spot = rand.1..9)
#         spot.to_s  
       
#         end
#      spot
#     end
#   end	
# end

#the code below works and passes the test
 def move(board)
      move = (1..9).to_a
      move.sample.to_s
    end

  end
end
















  #   1) if computer went first
		 #keep track of where computer placed X
		# board.turn_count == 1 #computer went first in turn
		# place X on upper right corner #placed X on spot #3
		# push 3 into X #place 3 in [] 
		# corners = [1,3,7,9] 
		# board.turn_count == 3 #computer went third in turn 
		# loop through corners checking aganist board.valid_move? #loop through corners, compare 1,3,7,9 aganist board.valid_move? to find empty space
		# place X on an empty corner #place X on the blank spot
		# push 1,7, or 9 into X #place another number where the 2nd X is placed into [3, ]
		# board.turn_count == 5 #computer went fifth in turn
		# loop through WIN_COMBINATIONS and compare X. 
		# place the third X
		

		# def move(board)
		# 	corners = [1,3,7,9]
		# 	spot = nil 			
		# 	case (turn_count)
		# 	when 0
		# 		spot == 3
		# 	when 1
		# 	when 2
		# 		corners.find {|y| board.valid_move?(y)}
		# 		spot == y
		# 	when 3
		# 		Game::WIN_COMBINATIONS.detect |combo| 
		# 	when 4

					
# CORNERS = [1,5,7,9]
#     def move(board)
#       case (board.turn_count)
#       when 0
#         "3"
#       when 1
#          CORNERS.find {|x| board.valid_move?(x)}
                

#       when 2
#         CORNERS.find {|x| board.valid_move?(x)}
        
#       when 3
#         Game::WIN_COMBINATIONS.detect {|combo|
#           (combo[0] == token && combo[1] == token && board.valid_move?(combo[2])) ||
#           (combo[0] == token && board.valid_move?(combo[1]) && combo[2] == token) ||
#           (board.valid_move?(combo[0]) && combo[1] == token && combo[2] == token)
#         }
#     end
# end



# end


# CORNERS = ["1","3","7","9"]

    # def move(board)
    #   case (board.turn_count)
    #   when 0
    #     "3"
    #   when 1
    #     CORNERS.detect {|cell|
    #       board.valid_move?(cell)}
    #   when 2
    #     if !board.valid_move?("5")
    #       "7"
    #     elsif !board.valid_move?("1")
    #       "9"
    #     elsif !board.valid_move?("6")
    #       "1"
    #     end
      # else


      		
#         win_combo = 
#         Game::WIN_COMBINATIONS.detect {|combo|
#            (board.cells[combo[0]] == token) 

#            (board.cells[combo[0]] == token && board.valid_move?((combo[1]+1).to_s) && board.cells[combo[2]] == token) ||
#            (board.valid_move?((combo[0]+1).to_s) && board.cells[combo[1]] == token && board.cells[combo[2]] == token)
#         }
#         win_combo.detect {|cell| board.valid_move?((cell+1).to_s)}
#       end
# win_combo = Game::WIN_COMBINATIONS.detect {|combo|
#           (board.cells[combo[0]] == token && board.cells[combo[1]] == token && board.valid_move?((combo[2]+1).to_s)) ||
#           (board.cells[combo[0]] == token && board.valid_move?((combo[1]+1).to_s) && board.cells[combo[2]] == token) ||
#           (board.valid_move?((combo[0]+1).to_s) && board.cells[combo[1]] == token && board.cells[combo[2]] == token)
#         }
#         if win_combo == nil
#           CORNERS.detect {|cell|
#           board.valid_move?(cell)}
#         else
#           win_combo.detect {|cell| board.valid_move?((cell+1).to_s)}
#         end
#   	end
#   end
# end
# end
  #   2) if computer went second





 