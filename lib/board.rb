require 'pry'

class Board
	attr_accessor :cells

	def initialize
		self.reset!
	end

	def cells
		@cells
	end

	def reset!
		self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	def display
		puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
		puts "-----------"
		puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
		puts "-----------"
		puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
	end

	#Returns value at that position
	def position(user_input)
		index = (user_input.to_i-1)
		self.cells[index]
	end

	def full?
		if self.cells.any? {|i| i == " "}
			false
		else
			true
		end
	end

	def turn_count
		self.cells.count {|i| i == "X" || i == "O"}
	end

	def taken?(user_input)
		space = self.position(user_input)
		if space == "X" || space == "O"
			true
		else
			false
		end
	end

	def valid_move?(user_input)
		if !self.taken?(user_input) && user_input.to_i.between?(1,9)
			true
		else
			false
		end
	end


	def update(user_input, player)
		if valid_move?(user_input)
			self.cells[user_input.to_i-1] = player.token
		end
	end

end






