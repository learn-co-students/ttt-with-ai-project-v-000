class Board # represents the data and logic of a TTT game board
	
	attr_accessor :cells

	def initialize # has property cells
		self.reset!
	end

	def reset! # back to an "empty" array
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end 

	def display # uses @cells to display board
		puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
		puts "-----------"
		puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
		puts "-----------"
		puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
	end 

	def position(input)
		@cells[input.to_i - 1]
	end 

	def update(position, player) # takes new input
		@cells[position.to_i - 1] = player.token # at the new position, place player's token
	end 

	def full? # completely filled with X's or O's
		# would be false if there is/are a space/space(s)
		#return true if there are no spaces
		@cells.all? {|cell| cell == "X" || cell == "O"}
	end

	def turn_count # count all of X's and O's
		@cells.count {|cell| cell == "X" || cell == "O"}
	end

	def taken?(input) # if there is a player's token there
		index = input.to_i - 1
		@cells[index] == "X" || @cells[index] == "O"
	end

	def valid_move?(input) # if between 1 and 9 && not taken
		index = input.to_i
		index.between?(1,9) && !taken?(index)
	end

end