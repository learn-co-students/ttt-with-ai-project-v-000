module Players
class Computer < Player
	def move(board)
		move=nil #clears the move
#if going first take the middle square
		if !board.taken?(5) 
			move = "5"
			
#if going second take a random corner
		elsif board.turn_count== 1 
			move =[1,3,7,9].sample.to_s
#if human went first, take a random unoccupied corner square your second turn			
		elsif board.turn_count== 2 
				move= [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s

#if comp has middle and opponent chooses a side
#too many bugs currently, going to finish other projects then fix
#    elsif board.turn_count==3 && (board.taken?(2) || board.taken?(4) || board.taken?(6) || board.taken?(8))
#      if board.taken?(2) || board.taken?(4)
#        move="1"
#      else
#        move="9"
#      end #end the setup
#avoid the corner trap				
		elsif board.turn_count == 4 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        		move = [2,4,6,8].sample.to_s


    #after the turn 3 setup, execute the trap!
    #also commented out until fix
#    elsif board.turn_count == 5 && (board.position(1) == board.position(5) || board.position(9) == board.position(5))
#      if (board.position(1) == board.position(5))
#        move= "4"
#      else
#        move="6"
#      end #end the closure of the trap


		else
			  Game::WIN_COMBINATIONS.detect do |cmb|

          # Prioritize a winning move
          if cmb.select{|i| board.position(i+1) == token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s

          # If there is no winning move, prevent the opponent from winning
          elsif cmb.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end

        # Otherwise move to a corner first, and then a side
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move
    	
	end #end of large if/else
		
	end #end of computer subclass
end #end of human module