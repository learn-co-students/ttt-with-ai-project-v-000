
class Board

	attr_accessor :cells

	def initialize
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
		reset!
	end

  # Resets the board to empty cells
	def reset!
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

  # Display the current board
	def display
		puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
		puts "-----------"
		puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
		puts "-----------"
		puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
	end

  # Returns the current value of a cell on the board
	def position(input)
		@cells[input.to_i - 1]
	end

  # Is the board full - are there any unoccupied positions
	def full?
		!@cells.include?(" " || "")
	end

  # How many turns have been taken
	def turn_count
		cells.count {|cell| cell == "X" || cell == "O"}
	end

  # Is the position empty
	def taken?(input)
		if position(input) == "X" || position(input) == "O"
			true # Position is taken
		else
			false # Position is free
		end
	end

  # Is the input a valid number between 1 and 9 and is this a valid move
	def valid_move?(input)
		if !(1..9).include?(input.to_i) # Valid number between 1 and 9
			false
		elsif taken?(input) == true # Position is taken so invalid move
			false
		elsif taken?(input) == false # Position is free so valid move
			true
		end
	end

  # Update the board entering the player's token into a cell of the board
	def update(input, player)
    input = input.to_i
		if valid_move?(input) # Check for a valid move
			 @cells[input-1] = player.token # Update the cell of the board with the player's token
		end
	end
end
