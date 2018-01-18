class Board

	attr_accessor :cells

	def initialize
		@cells = Array.new(9, " ")
	end

	def reset!
		# @cells.clear
		@cells = Array.new(9, " ")
	end

	def display
		[@cells.take(3), @cells.drop(3).take(3), @cells[6..8]].each_with_index do |line, index|
			puts "-----------" unless index == 0
			puts line.map{ |cell| " #{cell} |" }.join[0..-2]<<"\n"
		end
	end

	# convert player's perspective (1..9) to array index perspective (0..8) and return what's in the cell
	def position(input)
		index = input.to_i - 1
		@cells[index]
	end

	def full?
		@cells.none? { |cell| cell == " "  }
	end

	def turn_count
		# starts from 0
		cells.count{|token| token == "X" || token == "O"}
	end

	#--------- Now worknig on validating and making the moves -----------

	def taken?(input)
		position(input) != " "
	end

	def valid_move?(input)
		(1..9).to_a.include?(input.to_i) && !taken?(input.to_i)
	end

	def update(input, player)
		@cells[input.to_i - 1] = player.token
	end
end
