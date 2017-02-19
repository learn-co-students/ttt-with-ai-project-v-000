class Board
	attr_accessor :cells

	def initialize
		reset!
	end

	def reset!
		@cells = Array.new(9, " ")
	end

	def display
	    cell = "   "
	    separator = "-----------"
	    row1 = " #{cells[0]} " + "|" + " #{cells[1]} " + "|" + " #{cells[2]} "
	    row2 = " #{cells[3]} " + "|" + " #{cells[4]} " + "|" + " #{cells[5]} "
	    row3 = " #{cells[6]} " + "|" + " #{cells[7]} " + "|" + " #{cells[8]} "
	    puts row1
	    puts separator
	    puts row2
	    puts separator
	    puts row3
	end

	def input_to_index(input)
 		input.to_i - 1
	end

	def position(input)
		index = input_to_index(input)
		cells[index]
	end

	def full?
		cells.all? {|spot| spot == "X" || spot == "O"}
	end

	def turn_count
		cells.count {|spot| spot == "X" || spot == "O"}
	end

	def taken?(input)
		index = input_to_index(input)
		cells[index] == "X" || cells[index] == "O"
	end

	def valid_move?(input)
		input.to_i.between?(1,9) && !taken?(input)
	end

	def update(input, player)
		index = input_to_index(input)
		cells[index] = player.token
	end

end
