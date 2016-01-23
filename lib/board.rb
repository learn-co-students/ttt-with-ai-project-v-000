require 'pry'

class Board

	attr_accessor :cells

	def initialize
		@cells = [' ',' ',' ',' ',' ',' ',' ',' ',' ']		
	end

	def reset!
		@cells.clear
		@cells = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
	end

	def display
		puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
		puts "------------"
		puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
		puts "------------"
		puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
	end

	def position(value)
		@cells[value.to_i - 1]
	end

	def full?
		!@cells.include?(' ')
	end

	def turn_count
		cells.count {|cell| cell == "X" || cell == "O"}
	end

	def taken?(space)
		@cells[space.to_i - 1] == "X" || @cells[space.to_i - 1] == "O"
	end

	def valid_move?(space)
		space.to_i < 10 && space.to_i > 0 && !taken?(space)
	end

	def update(space, player)
		@cells[space.to_i - 1] = player.token
	end

end
