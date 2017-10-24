class Board
	attr_accessor :cells

	def reset!
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	def initialize
		reset!
	end

	def display
		puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
		puts "-----------"
		puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
		puts "-----------"
		puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
	end

	def position(user_input)
		cells[user_input.to_i - 1]
	end

	def full?
	   @cells.all? do |position|
	   position == "X" || position == "O"
	   end
	end

	def turn_count
	   counter = 0
	   @cells.each do |turns|
	     if turns == "X" || turns == "O"
	       counter += 1
	     end
	   end
	   counter
	end

	def taken?(user_input)
	    position(user_input) == "X" || position(user_input) == "O"
	end

	def valid_move?(user_input)
	    user_input.to_i.between?(1,9) && !taken?(user_input)
	end

	def update(user_input, player)
		cells[user_input.to_i - 1] = player.token
	end

end
