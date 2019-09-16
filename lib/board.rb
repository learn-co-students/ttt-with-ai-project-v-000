class Board
	attr_accessor :cells

	def initialize
		@cells = [" "," "," "," "," "," "," "," "," ",]
	end

	def reset!
		@cells = [" "," "," "," "," "," "," "," "," ",]
	end

	def display
		puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
		puts "-------------"
		puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
		puts "-------------"
		puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
	end

	def position(input)
		input = input.to_i
		if input > 0 && input < 10
			input -= 1
			@cells[input]
		end
	end

	def full?
		!@cells.include?(" ") 
	end

	def turn_count
		@cells.count{|c| c != " "}
	end

	def taken?(position)
		@cells[position.to_i-1] == " " ? false : true
	end

	def valid_move?(position)
		position = position.to_i
		if position > 0 && position < 10 
			!taken?(position)
		else
			false
		end
	end

	def update(position, player)
		position = position.to_i
		@cells[position-1] = player.token
	end

end	
