class Board

	attr_reader :cells

	def initialize
		self.reset!
	end

	def cells=(cells)
		@cells = cells
	end

	def reset!
		@cells = [" "," "," "," "," "," "," "," "," "]
	end

	def display
		puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
		puts "-----------"
		puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
		puts "-----------"
		puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
	end

	def position(cell)
		self.cells[cell.to_i - 1]
	end

	def full?
		self.cells.all? {|cell| cell != " "}
	end

	def turn_count
		count = 0
		self.cells.each {|cell| count+=1 unless cell == " "}
		count
	end

	def taken?(cell)
		self.position(cell) == "X" || self.position(cell) == "O" 
	end

	def valid_move?(move)
		move = move.to_i
		move > 0 && move < 10 && self.taken?(move) == false
	end

	def update(position, player)
		self.cells[position.to_i - 1] = player.token
	end
end

