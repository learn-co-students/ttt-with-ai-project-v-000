class Board
	attr_accessor :cells

	def initialize
		self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end


	def reset!
		@cells = Array.new(9, " ")
	end

	def display
		puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
		puts "-----------"
		puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
		puts "-----------"
		puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
	end

	def position(position)
		@cells[position.to_i - 1] 
	end

	def full?
		@cells.all? {|place| if place == "X" || place == "O" 
			true 
		else
			false 
		end }
	end

	def turn_count
		@cells.count {|mark| mark == "X" || mark == "O"}
	end

	def taken?(mark)
		if @cells[mark.to_i - 1] == "X" || @cells[mark.to_i - 1] == "O"
			return true
		else
			return false
		end
	end

	def valid_move?(move)
		if move.to_i.between?(1,9) && taken?(move) == true 
			return false
		elsif move.to_i.between?(1,9) && taken?(move) == false
			return true
		else 
			return false
		end
	end

	def update(place, player)
		@cells[place.to_i - 1] = player.token
	end



end























