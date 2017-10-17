class Board

	attr_accessor :cells

	def initialize
		self.reset!
	end

	def reset!
		@cells = [" "," "," "," "," "," "," "," "," "]
	end

	def display
		puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
		puts "-----------"
		puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
		puts "-----------"
		puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
	end

	def position(position)
		index_from_pos = position.to_i - 1
		@cells[index_from_pos]
	end

	def full?
		if @cells.count(" ") > 1
			false
		else
			true
		end
	end

	def turn_count
		empty_cells = @cells.count(" ")
		9 - empty_cells
	end

	def taken?(position)
		if self.position(position) == "X" || self.position(position) == "O"
			true
		else
			false
		end
	end


	def valid_move?(position)
		if self.taken?(position) == false && position.to_i >= 1 && position.to_i <= 9
			true
		else
			false
		end
	end

	def update(position, player)
		if self.valid_move?(position) == true
			@cells[position.to_i - 1] = player.token
		end
	end

end

