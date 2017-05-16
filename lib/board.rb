class Board

#1) Board #cells has an attribute to store the cells of the board
	attr_accessor :cells

	def initialize
		reset!
	end

#2) Board #reset! can reset the state of the cells in the board
	def reset!
		 #2) Board #reset! sets the cells of the board to a 9 element array of " "
		@cells = Array.new(9," ")
	end


#1) Board #display prints the board
	def display
		puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
		puts "-----------"
		puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
		puts "-----------"
		puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
	end

#1) Board #position takes in user input and returns the value of the board cell
	def position(input)
		cells[input.to_i - 1]
	end


#Board #full? returns true for a full board
	def full?
		#.all? returns a true if all values of the array fit the condition specified in the block
		cells.all? {|token| token == "X" || token == "O"}
	end

#Board #turn_count returns the amount of turns based on cell value
	def turn_count
		#.count counts each time the token is X or O to determine the amount of turns
		cells.count {|token| token == "X" || token == "O"}
	end

# Board #taken? returns true if the position is X or O
# Board #taken? returns false if the position is empty or blank
	def taken?(input)
		!(position(input) == " " || position(input) == "")
	end
	

#Board #valid_move? returns true for user input between 1-9 that is not taken
	def valid_move?(input)
		input.to_i.between?(1,9) && !taken?(input)
	end

 #Board #update updates the cells in the boastrips your string of both
 
 	def update(input, player)
 		cells[input.to_i - 1] = player.token
 	end

end
