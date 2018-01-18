class Board
	attr_accessor :cells

	def initialize
		reset!
	end

	def display
		puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
		puts "-----------"
		puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
		puts "-----------"
		puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "		
	end

	def input_to_index(input)
		input.to_i - 1
	end

	def position(input)
		cells[input_to_index(input)]
	end

	def full?
		cells.all? { |cell| cell == 'X' || cell == 'O' }
	end

	def turn_count
		cells.count { |element| element == 'X' || element == 'O' }
	end

	def taken?(input)
		position(input) != ' '
	end

	def valid_move?(input)
		input.to_i.between?(1, 9) && !taken?(input)
	end

	def update(input, player)
		cells[input_to_index(input)] = player.token
	end

	def reset!
		self.cells = Array.new(9, " ")
	end

		def display_start
		puts " 1 | 2 | 3 "
		puts "-----------"
		puts " 4 | 5 | 6 "
		puts "-----------"
		puts " 7 | 8 | 9 "		
	end
end