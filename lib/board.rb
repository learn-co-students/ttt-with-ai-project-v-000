class Board
	attr_accessor :cells

	def initialize(board = Array.new(9, " "))
		@cells = board
		# @cells = Array.new(9, " ")
	end

	def reset!
		self.cells.clear
		self.cells = Array.new(9, " ")
	end

	def display
		puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
		puts "-----------"
		puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
		puts "-----------"
		puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
	end

	def position(user_input)
		self.cells[user_input.to_i-1] #returns player from user input
	end

	def full?
		self.cells.each do |cell| 
			if cell == " " 
				return false
			end
		end
		true
	end

	def turn_count
		self.cells.select { |cell| cell != " " }.count 
	end

	def taken?(user_input)
		if position(user_input) == "X" || position(user_input) == "O"
			true
		else
			false
		end
	end

	def valid_move?(user_input)
		if user_input.to_i > 9 || user_input.to_i <1
			false
		else
			taken?(user_input) ? false : true
		end
	end

	def update(user_input, player)
		self.cells[user_input.to_i-1] = player.token
		self.display
	end


end
