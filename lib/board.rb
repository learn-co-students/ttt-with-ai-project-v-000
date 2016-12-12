class Board
	attr_accessor :cells, :turns_taken
	def initialize
		@cells = Array.new(9, " ")
		@turns_taken = []
	end

	def reset!
		@cells = Array.new(9, " ")
	end

	def display
		puts " #{cells[0]} | #{cells[1]} | #{cells[2]} ", 
		"-----------", 
		" #{cells[3]} | #{cells[4]} | #{cells[5]} ", 
		"-----------", 
		" #{cells[6]} | #{cells[7]} | #{cells[8]} "
	end

	def position(input)
		return self.cells[input.to_i - 1]
	end

	def full?
		self.cells.include?(" ") ? false : true
	end

	def turn_count
		turns = 0
		self.cells.each do |i|
			if i == "X" || i == "O"
				turns += 1
			end
		end
		return turns
	end

	def taken?(position)
		self.cells[position.to_i-1] != " " 
	end

	def valid_move?(position)
		!self.taken?(position) && position.to_i-1 >= 0 && position.to_i-1 <=9

	end

	def update(position, player)
		self.cells[position.to_i - 1] = player.token
		self.turns_taken << position
	end

end
