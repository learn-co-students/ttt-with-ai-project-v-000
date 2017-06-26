class Board
	attr_accessor :cells, :index

	def initialize
	    self.reset!
	end

	def reset!
		@cells = []
		9.times{@cells << " "}
	end	 

	def display
		puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
		puts "-----------"
		puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
		puts "-----------"
		puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
	end

	def input_to_index(input)
		@index = input.to_i - 1
	end

	def position(input)
		@cells[input_to_index(input)]
	end

	def full?
		@cells.all?{|cell| cell != " "} 
	end

	def turn_count
		@cells.count{|cell| cell == "X" || cell == "O"} + 1
	end

	def taken?(input)
		@cells[input_to_index(input)] == "X" || @cells[index] == "O"
	end

	def valid_move?(input)
		!taken?(input) && input_to_index(input).between?(0,8)
	end

	def update(input,player)
		@cells[input_to_index(input)] = player.token
	end

end


