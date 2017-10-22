class Board

	attr_accessor :cells

	def initialize
		reset!
	end

	def cells
		@cells
	end

	def reset!
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	def display
		#print out board
		puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
		puts "------------"
		puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
		puts "------------"
		puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
	end

	def position(x)
		num = x.to_i
		number = num - 1
		value = @cells[ number ]
		value
		
	end

	def update(spot, player)
		#player.token
		
		@cells[spot.to_i - 1] = player.token
	end

	def full?
		@cells.each do |cell|
			if cell == " " 
				return false
			end
		end
	end

	def turn_count
		count = 0
		@cells.each do |cell|
			if cell == "X" || cell == "O"
				count += 1
			end
		end
		count
	end

	def taken?(x)
		n = position(x)
		if n == "X" || n == "O"
			true
		else
			false
		end
	end

	def valid_move?(x)
		if x.to_i < 1 || x.to_i > 9
			false
		elsif taken?(x)
			false
		else
			true
		end
	end
	
end












