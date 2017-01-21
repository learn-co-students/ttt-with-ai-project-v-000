

class Board
	attr_accessor :cells, :answer_token

	def initialize
		self.reset!
		@answer_token = []
	end

	def reset!
		@cells = Array.new(9, " ")
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
		corners = ["1", "3", "7", "9"]
		eligible_corners = corners.select do |corner|
			!self.taken?(corner)
		end
		eligible_corners.sample
	end

	def available_spots
		available = []
		cells.each_with_index do |cell, index|
			if cell == " "
				available << (index + 1).to_s
			end
		end
		available.sample
	end

	def block_positions
		board = self.cells
		@answer_token = []
		answers = []
		Game::WIN_COMBINATIONS.each do |c|
			indexes = [c[0], c[1], c[2]]
			my_combo = [board[c[0]], board[c[1]], board[c[2]]]
			if  my_combo.sort === [" ", "X", "X"] || my_combo.sort === [" ", "O", "O"]
				answer_token << my_combo.sort[2]
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
		cells[position.to_i - 1]
	end

	def full?
		cells.all? {|cell| cell != " "}
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