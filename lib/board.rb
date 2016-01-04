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
	end

	def position(position)
		@cells[position.to_i-1]
	end

	def full?
		!@cells.any? {|cell| cell == " "}
	end

	def turn_count
		@cells.select {|cell| cell != " "}.length
	end

	def taken?(position)
		@cells[position.to_i-1] != " "
	end

	def valid_move?(position)
		position.to_i.between?(1,9) && !taken?(position)
	end

	def update(position, player)
		@cells[position.to_i-1] = player.token
	end
end
