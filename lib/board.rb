class Board

	attr_accessor :cells

	def initialize
		reset!
	end

	def reset!
		@cells = Array.new(9, " ")
	end

	def display
		puts " #{cells[0]} | #{cells[1]} | #{@cells[2]} "
		puts "-----------"
		puts " #{cells[3]} | #{cells[4]} | #{@cells[5]} "
		puts "-----------"
		puts " #{cells[6]} | #{cells[7]} | #{@cells[8]} "
	end

	def position(input)
		@cells[(input.to_i - 1)]
	end

	def full?
		if @cells.include?(" ")
			false
		else
			true
		end
	end

	def turn_count
		#cells.count { |position| position.include?("X" || "O")}
		count = 1
		@cells.each do |turn|
			if turn == " "
				count +=  1
			end
		end
		10 - count
	end

	def taken?(index)
		index  = index.to_i - 1
		if @cells[index].include?(" ")
			false
		else
			true
		end
	end

	def valid_move?(input)
		!taken?(input) && input.to_i.between?(1, 9)
	end

	def update(input, player)
		input = input.to_i - 1
		@cells[input] = player.token
		self.display
	end




end 