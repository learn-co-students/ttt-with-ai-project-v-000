class Board 

	attr_accessor :cells

	def initialize
		reset!
	end

	def display
		puts (" #{cells[0]} | #{cells[1]} | #{cells[2]} ")
		puts ("-----------")
		puts (" #{cells[3]} | #{cells[4]} | #{cells[5]} ")
		puts ("-----------")
		puts (" #{cells[6]} | #{cells[7]} | #{cells[8]} ")
	end

	def position(input) 
		@cells[input.to_i - 1]
	end

	def full?
		@cells.all? { |full| full != " " } 
	end

	def turn_count
		counter = 0
		@cells.each do |turn|
			if turn == "X" || turn == "O"
				counter += 1
			end
		end
		counter
	end

	def taken?(input)
		if @cells[input.to_i - 1] == "X" || @cells[input.to_i - 1] == "O"
			true
		elsif @cells[input.to_i - 1] == " " || @cells[input.to_i - 1] == nil
			false
		end
	end

	def valid_move?(input)
		(input.to_i - 1).between?(0,8) && !taken?(input) 
	end

	def update(input, player)
		@cells[input.to_i - 1] = player.token
	end

	def reset!
		@cells = Array.new(9, " ")
	end
end