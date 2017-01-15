

class Board
	attr_accessor :cells

	def initialize
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	def reset!
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	def display
		puts ""
		puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
		puts "-----------"  
		puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
		puts "-----------" 
		puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
		puts ""
	end

	def which_cornors?
		board = self.cells
		corners = ["1", "3", "7", "9"]
		eligible_corners = corners.select do |corner|
			!self.taken?(corner)
		end
		eligible_corners.sample
	end

	def needs_block?
		needs_block = false
		board = self.cells
		Game::WIN_COMBINATIONS.each do |combo|
			i1 = combo[0]
			i2 = combo[1]
			i3 = combo[2]
			my_combo = [board[i1], board[i2], board[i3]]
			if  my_combo.sort === [" ", "X", "X"] || my_combo.sort === [" ", "O", "O"]
				needs_block = true
			end
		end
		needs_block
	end

	def available_spots
		available = []
		self.cells.each_with_index do |cell, index|
			if cell == " "
				available << (index + 1).to_s
			end
		end
		available.sample
	end

	def block_positions
		board = self.cells
		
		answers = []
		Game::WIN_COMBINATIONS.each do |combo|
			i1 = combo[0]
			i2 = combo[1]
			i3 = combo[2]
			indexes = [i1, i2, i3]
			my_combo = [board[i1], board[i2], board[i3]]
			if  my_combo.sort === [" ", "X", "X"] || my_combo.sort === [" ", "O", "O"]
				answers << indexes.select do |index|
					board[index] == " "
				end
			end
		end
		answers.flatten!
		answers = answers.map { |a| a + 1}
		answers
	end

	def position(position)
		@cells[position.to_i - 1]
	end

	def full?
		!self.cells.include?(" ")
	end

	def turn_count
		(self.cells.select {|cell| cell == "O" || cell == "X"}).count
	end

	def taken?(position)
		self.position(position) != " "
	end

	def valid_move?(position)
		!self.taken?(position) && position.to_i.between?(1, 9)
	end

	def update(position, player)
		@cells[position.to_i - 1] = player.token
	end

end