module Players
	class Computer < Players # c inherits from player, is this right?
	#will be Players::Computer
		def move(board)
			#returns the move the computer wants to make, in
			#the form of a 1-9 string
			#valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
			# up to me how the computer wants to decide this.
			#random/validator/keep picking?
			# game should be unwinnable -- you can hardcode logic
			# condition-based algorithm:
			# "On turn 1 always try to go in the middle if you can"
			# and if not "try to go in a corner

		end

		def computer_move
			computer.move
		end
	end

end
