module Players

	class Human < Player


		def move(board)
		 	puts "Please select move (1-9): "
			input = gets.strip
		end
		# attr_accessor :board

		# All this would have been better, I think, but did not work b/c of test for human that says move([]) <for move(board)>.  The tests want this to return a string.  So be it.
		# def move(board)
		#Another problem here: it would make sense to test whether the move is valid here.  But the tests expect a string to be returned.  It seems silly in Game#turn, to call this method, test it by turning it into an integer/index, then return a string, and then turn it back into a integer/index number so the board can be updated
		# 	puts "Please select move (1-9): "
		# 	index = gets.strip.to_i - 1
		# 	if index.between?(0,8) && board.cells[index] == " "
		# 		index
		# 	else
		# 		puts "invalid"
		# 		move(board)
		# 	end

			#171016: I have no idea what this is about. It passes but makes no sense.
			#Why is this asking for an argument, but then not
			#using it.
			#Related: why does the test call for this method to have an argument equal to an empty array?  This is why i made the argument optional with "= nil"

		# def valid_move?(num)
		# 	tester = num.to_i - 1
		# 	tester.between?(0,8) && board.cells[tester] == " "
		# end


	end

end
