class Board
	attr_accessor :cells

	def initialize
		@cells = [" "]*9
	end

	def reset!
		@cells = [" "]*9
	end

	def display
		puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
		puts "-----------"
		puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
		puts "-----------"
		puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
	end

	def position(input)
		input = input.to_i
		self.cells[input-1]
	end

	def turn_count
		self.cells.count {|cell| (cell == "X" || cell == "O") }
	end

	def full?
		self.turn_count == 9 ? true : false
	end

	def taken?(input)
		input = input.to_i
		self.cells[input-1] == "X" || self.cells[input-1] == "O" ? true:false
	end

	def valid_move?(input)
		!self.taken?(input) && (1..9).include?(input.to_i) ? true:false
	end

	def update(cell, player)
		self.cells[cell.to_i-1] = player.token
	end

end



