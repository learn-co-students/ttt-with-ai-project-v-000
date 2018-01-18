class Board
	attr_accessor :cells

	def initialize
		reset!
	end

	 def reset!
	 	@cells = Array.new(9, " ")
	 end


		

	def display
	    cell = "   "
	    separator = "-----------"
	    row1 = " #{cells[0]} " + "|" + " #{cells[1]} " + "|" + " #{cells[2]} "
	    row2 = " #{cells[3]} " + "|" + " #{cells[4]} " + "|" + " #{cells[5]} "
	    row3 = " #{cells[6]} " + "|" + " #{cells[7]} " + "|" + " #{cells[8]} "
	    puts row1
	    puts separator
	    puts row2
	    puts separator
	    puts row3
	end

	def position(user_input)
		cells[user_input.to_i-1]
	end

	def full?
		cells.all? {|spot| spot == "X" || spot == "O"}
	end

	def turn_count
		cells.count {|spot| spot == "X" || spot == "O"}
	end

	def taken?(user_input)
		if cells[user_input.to_i-1] == "X"
			return true
		elsif cells[user_input.to_i-1] == "O"
			return true
		else
			return false
		end
	end



	def valid_move?(user_input)
	
		user_input.to_i.between?(1,9) && !taken?(user_input)
	end

	def update(user_input, player)
		cells[user_input.to_i-1] = player.token
	end

end
