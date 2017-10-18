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
	    self.cells.all? {|value| (value == "X" || value == "O")}
	end

#turn_count keeps track of the number of turns
  def turn_count
    self.cells.count{|value| (value=="X" || value== "O")}
  end

#taken? checks that player's desired location is empty/available to be played.  If the position is free, method returns false
	def taken?(position)
		!(self.position(position).nil? || self.position(position) == " ")
	end

#valid_move? returns true if move is on the board and not already occupied
  def valid_move?(position)
    (position.to_i).between?(1, 9) && !(taken?(position))
  end

#update updates the cells in the board with the player token according to input.  player is Player object and has a token property
	def update(position, player)
			self.cells[position.to_i - 1] = player.token
	end

end
