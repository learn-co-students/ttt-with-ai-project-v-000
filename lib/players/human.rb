module Players

	class Human < Player # human methods

		def move(board) 
			# allows a human player to enter a move via the CLI
			# return the value the user enters
			input = gets.strip
			input
		end

	end 

end