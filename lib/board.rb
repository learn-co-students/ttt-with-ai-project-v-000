require 'pry'
class Board

	attr_accessor :cells

	def initialize
		reset!
	end

#creates a 9-member array of empty cells, to represent the game board
	def reset!
		self.cells = Array.new(9, " ")
	end

#outputs the board in its current state
	def display
		puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
		puts "-----------"
		puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
		puts "-----------"
		puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
	end

#converts user's input to array index, returns value of the board cell at that index
	def position(position)
		position = position.to_i - 1
		self.cells[position]
	end

#returns true for a full board
	def full?
	    self.cells.all? {|value| value == "X" || value == "O"}
	end

end
