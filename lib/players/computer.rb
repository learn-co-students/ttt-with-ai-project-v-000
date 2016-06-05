class Computer < Player


	def move(board)
		#board.display

     #input values are 1-9


     if board.turn_count == 0
     	input = "5"



     	#play top left box to win or block

	     elsif (board.taken?(1) == false &&
	     	board.taken?(2)  &&
	     	board.cells[1] == board.cells[2])
	     	input = "1"

	     elsif (board.taken?(1) == false &&
	     	board.taken?(5) &&
	     	board.cells[4] == board.cells[8])
	     	input = "1"

	     elsif (board.taken?(1) == false &&
	     	board.taken?(4) &&
	     	board.cells[3] == board.cells[6])
	     	input = "1"

	     #play top center box to win or block

	     elsif (board.taken?(2) == false &&
	     	board.taken?(1)  &&
	     	board.cells[0] == board.cells[2])
	     	input = "2"

	     elsif (board.taken?(2) == false &&
	     	board.taken?(5) &&
	     	board.cells[4] == board.cells[7])
	     	input = "2"

     	#play top right box to win or block

	     elsif (board.taken?(3) == false &&
	     	board.taken?(1)  &&
	     	board.cells[0] == board.cells[1])
	     	input = "3"

	     elsif (board.taken?(3) == false &&
	     	board.taken?(5) &&
	     	board.cells[4] == board.cells[6])
	     	input = "3"

	     elsif (board.taken?(3) == false &&
	     	board.taken?(6) &&
	     	board.cells[5] == board.cells[8])
	     	input = "3"


	     #play left center box to win or block

	     elsif (board.taken?(4) == false &&
	     	board.taken?(1)  &&
	     	board.cells[0] == board.cells[6])
	     	input = "4"

	     elsif (board.taken?(4) == false &&
	     	board.taken?(5) &&
	     	board.cells[4] == board.cells[5])
	     	input = "4"

     	#play center box to win or block

	     elsif (board.taken?(5) == false &&
	     	board.taken?(4)  &&
	     	board.cells[3] == board.cells[5])
	     	input = "5"

	     elsif (board.taken?(5) == false &&
	     	board.taken?(2) &&
	     	board.cells[1] == board.cells[7])
	     	input = "5"

	     elsif (board.taken?(5) == false &&
	     	board.taken?(1) &&
	     	board.cells[0] == board.cells[8])
	     	input = "5"

	     elsif (board.taken?(5) == false &&
	     	board.taken?(3) &&
	     	board.cells[2] == board.cells[6])
	     	input = "5"

     	#play right center box to win or block

	     elsif (board.taken?(6) == false &&
	     	board.taken?(4)  &&
	     	board.cells[3] == board.cells[4])
	     	input = "6"

	     elsif (board.taken?(6) == false &&
	     	board.taken?(3) &&
	     	board.cells[2] == board.cells[8])
	     	input = "6"

     	#play bottom left box to win or block

	     elsif (board.taken?(7) == false &&
	     	board.taken?(1)  &&
	     	board.cells[0] == board.cells[3])
	     	input = "7"

	     elsif (board.taken?(7) == false &&
	     	board.taken?(8) &&
	     	board.cells[7] == board.cells[8])
	     	input = "7"

	     elsif (board.taken?(7) == false &&
	     	board.taken?(3) &&
	     	board.cells[2] == board.cells[4])
	     	input = "7"

     	#play bottom center box to win or block

	     elsif (board.taken?(8) == false &&
	     	board.taken?(2)  &&
	     	board.cells[1] == board.cells[4])
	     	input = "8"

	     elsif (board.taken?(8) == false &&
	     	board.taken?(7) &&
	     	board.cells[6] == board.cells[8])
	     	input = "8"


     	#play bottom right box to win or block

	     elsif (board.taken?(9) == false &&
	     	board.taken?(3)  &&
	     	board.cells[2] == board.cells[5])
	     	input = "9"

	     elsif (board.taken?(9) == false &&
	     	board.taken?(7) &&
	     	board.cells[6] == board.cells[7])
	     	input = "9"

	     elsif (board.taken?(9) == false &&
	     	board.taken?(1) &&
	     	board.cells[0] == board.cells[4])
	     	input = "9"

	     elsif board.taken?(5) == false
	     	input = "5"


	     elsif board.taken?(1) == false
	     	input = "1"

	     elsif board.taken?(3) == false
	     	input = "3"
	     elsif board.taken?(7) == false
	     	input = "7"
	     elsif board.taken?(9) == false
	     	input = "9"

	     else input = rand(1..9).to_s

	  	end

		input
	end
end
