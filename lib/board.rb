require 'pry'

class Board

	attr_accessor :cells

	def initialize
		self.reset!
		@cells
	end

	def reset!
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	def display
		puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
		puts "-----------"
		puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
		puts "-----------"
		puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
	end

	def position(input)
		input = input.to_i - 1
		cells[input]
	end

	def full?
		!cells.include?(" ")
	end

	def turn_count
		count = 0
		cells.map do |cell|
			if cell != " "
				count += 1
			end
		end
		count
	end

	def taken?(input)
		position(input) == "X" || position(input) == "O"
	end

	def valid_move?(input)
		input.to_i.between?(1,9) && !taken?(input)
	end

	def update(input, player)
		if valid_move?(input)
			input = input.to_i - 1
			cells[input] = player.token
		end
	end

	# binding.pry

end

#rspec spec/01_board_spec.rb