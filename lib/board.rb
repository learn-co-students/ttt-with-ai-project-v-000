class Board
	attr_accessor :cells

	def reset!
		@cells = Array.new(9, " ")
	end

	def initialize
		reset!
	end

	def display
		puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
		puts " ----------- "
		puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
		puts " ----------- "
		puts " #{cells[6]} | #{cells[7]} | #{cells[8]}\n "
	end

	def position(input)
		cells[input.to_i - 1]
	end

	def full?
		cells.all? {|c| c != " "}
	end

	def turn_count
		cells.count {|p| p == "X" || p == "O"}
	end

	def taken?(input)
		!(position(input) == " ")
	end

	def valid_move?(input)
		input.to_i.between?(1, 9) && !taken?(input)
	end

	def update(input, player)
		# I DON'T UNDERSTAND WHY THE LINE BELOW DOES NOT WORK...?
		# position(input) = player.token
		cells[input.to_i - 1] = player.token
	end

end