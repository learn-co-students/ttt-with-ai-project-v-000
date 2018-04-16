module Players
	class Computer < Player # c inherits from players, is this right?

 		def move(board)
 			move = nil # why not move = [] or move = ""
 			 # look at DB for rules of ttt # look up algorithms. I don't get all of this. 
 			
 			# grab the middle square
 			if !board.taken?(5)
 			  	move = "5"
 			#second turn/middle taken, take the ul corner 
 			elsif board.turn_count == 1
 			  	move = "1"

 			 #if u have the center, take a corner
 			elsif board.turn_count == 2
 				move = [1,3, 7, 9].detect{|index| !board.taken(index)}.to_s
 			#go on offense if other player has two in a row
 			elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        		move = "2"

        	#what now?, something with the win combinations 
        else 
        	Game::WIN_COMBINATIONS.detect do |combo|

        	if combo.select {|i| board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s

          # If you can't play any winning moves, play a move to block the opponent from winning.
          	elsif combo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s	

        	end 
        end 
      	move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
        end 
      move
  	end 
  end 
end
        		

			#has to initalize? Or player_1 = Players::Computer.new("X")
			#try random, easiest, pick 1-9
			# then try , turn 1, if [4] == "", go to [4] if 4[] is full, pick randomly 0,2,6,8) --corners
        	
# 			#returns the move the computer wants to make, in
# 			#the form of a 1-9 string
# 			#valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
# 			# up to me how the computer wants to decide this.
# 			#random/validator/keep picking?
# 			# game should be unwinnable -- you can hardcode logic
# 			# condition-based algorithm:
# 			# "On turn 1 always try to go in the middle if you can"
# 			# and if not "try to go in a corner


		#some private methods?
		#valid_moves

 # 		def computer_move
 # 			computer.move(board)
 # 		end
	# end


