class Board

	attr_accessor :cells

	def initialize
		@cells = Array.new(9, " ")
	end

	def reset!
		@cells = Array.new(9, " ")
	end

	def display
		puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
		puts "-----------"
		puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
		puts "-----------"
		puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
		puts "--------------------------------------------------"
	end

	def position(input)
		@cells[input.to_i - 1]
	end

	def full?
		@cells.none? {|s| s == " "}
	end

	def turn_count
		@cells.count {|s| s != " "}
	end

	def taken?(input)
		@cells[input.to_i - 1] == "X" || @cells[input.to_i - 1] == "O"
	end

	def valid_move?(input)
		input.to_i.between?(1, 9) && taken?(input) == false
	end

	def update(input, player)
		if valid_move?(input)
		@cells[input.to_i - 1] = player.token
		end
	end
end

