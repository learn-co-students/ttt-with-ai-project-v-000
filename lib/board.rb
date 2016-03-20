class Board

	attr_accessor :cells

	def initialize
		reset!
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

	def position(input)
		self.cells[input.to_i-1]
	end

	def full?
		if self.cells.all?{|cell| cell == "X" || cell == "O"}
			true
		else
			false
		end
	end

	def turn_count
		count = 0
		self.cells.each do |cell|
		  if cell == "X" || cell == "O"
		    count +=1
		  end
		end
	  count
	end

	def taken?(position)
		self.cells[position.to_i-1] == "X" || self.cells[position.to_i-1] == "O"
	end

	def valid_move?(input)
		!taken?(input) && input.to_i.between?(1, 9)
	end

	def update(position, player)
		self.cells[position.to_i-1] = player.token
	end
end