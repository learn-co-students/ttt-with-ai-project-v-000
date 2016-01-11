class Board
	attr_reader :cells

	def initialize
		@cells = Array.new(9, " ")
	end

	def reset!
		@cells.collect!{|cell| cell = " "}
	end

	def display
	    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
	    puts "-----------"
	    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
	    puts "-----------"
	    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
	end

	def position(input)
		@cells[input.to_i - 1]
	end

	def update(input, player)
		@cell[input.to_i - 1] = player.token if valid_move?(input) && !full? 
	end

	def full?
		turn_count == 9 ? true : false
	end

	def turn_count
		count = 0
		@cells.each{|cell| count += 1 if cell == "X" or cell == "O" }
		count
	end

	def taken?(input)
		position(input) == "X" || position(input) == "O" ? true : false
	end

	def valid_move?(input)
		taken?(input) == false ? true : false
	end
end