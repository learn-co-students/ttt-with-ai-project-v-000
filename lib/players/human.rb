module Players

	class Human < Player


	 def move(board)
	 	puts "Please select move (1-9): "
	 	input = gets.strip
	 	tester = input.to_i - 1
	 			# The crazy conditional board == [] is here b/c of the test for humans, which for some reason puts ([]) as an argument.  I wanted to put the test here for whether it's a valid move, expecially since (board) is requied argument, but again, had to find a way to work within the confines of this test
				#Can't use board.valid_test? b/c it won't allow me to access the board and test for board == [ ]
	 	if tester.between?(0,8) && (board == [ ] || board.cells[tester] == " ")
	 		input
	 	else
	 		puts "invalid"
	 		move(board)
	 	end
	 end

# This works -- uncomment if there is a problem
		# def move(board)
		#  	puts "Please select move (1-9): "
		# 	input = gets.strip
		# end


		# attr_accessor :board


		#Another problem here: it would make sense to test whether the move is valid here.  But the tests expect a string to be returned.  It seems silly in Game#turn, to call this method, test it by turning it into an integer/index, then return a string, and then turn it back into a integer/index number so the board can be updated

		# All this below would have been better, I think, but did not work b/c of test for human that says move([]) <for move(board)>.  The tests want this to return a string.  So be it.
		# def move(board)
		# 	puts "Please select move (1-9): "
		# 	index = gets.strip.to_i - 1
		# 	if index.between?(0,8) && board.cells[index] == " "
		# 		index
		# 	else
		# 		puts "invalid"
		# 		move(board)
		# 	end

			#171016 [TN: original problem with understanding why they had an argument for #move]: I have no idea what this is about. It passes but makes no sense.
			#Why is this asking for an argument, but then not
			#using it.
			#Related: why does the test call for this method to have an argument equal to an empty array?  This is why i made the argument optional with "= nil"

		# def valid_move?(num)
		# 	tester = num.to_i - 1
		# 	tester.between?(0,8) && board.cells[tester] == " "
		# end


	end

end
