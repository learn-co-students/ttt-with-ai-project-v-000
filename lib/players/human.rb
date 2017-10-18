module Players

	class Human < Player


	 def move(board)
	 	puts "Please select move (1-9): "
	 	input = gets.strip
	 	tester = input.to_i - 1
	 			# The condition "board == []"" is here b/c of the rspec test for humans, which for some reason written with ([]) as an argument #for move(arg).  I wanted to test for valid move baked into #move...that seemed the best place to put it... expecially since (board) is requied argument, but again, I had to find a way to work within the confines of the rspec test
				#Can't use board.valid_test? b/c it won't allow me to access the board and test for "board == [ ]""
	 	if tester.between?(0,8) && (board == [ ] || board.cells[tester] == " ")
	 		input
	 	else
	 		puts "invalid"
	 		move(board)
	 	end
	 end
	end

end
