class Board

	attr_accessor :cells

	def initialize
		reset!
	end

	def reset!
		@cells = Array.new(9, " ")
	end

	def display
		puts "           "
		puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    	puts "-----------"
    	puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    	puts "-----------"
    	puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    	puts "           "
	end

	def position(user_input)
		@cells[user_input.to_i - 1]
	end

	def update(string, player)
		@cells[string.to_i - 1] = player.token
	end

	def full?
		@cells.all? {|token| token == "X" || token == "O" ? true : false }
	end

	def turn_count
		@cells.count {|token| token == "X" || token == "O"}
	end

	def taken?(cell)
		position(cell) == "X" || position(cell) == "O"
	end

	def valid_move?(position)
		position.to_i.between?(1,9) && !taken?(position.to_i)
	end

end