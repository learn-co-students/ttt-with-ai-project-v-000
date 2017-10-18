class Board

	attr_accessor :cells

	@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

	def reset!
		self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	def initialize
		reset!
	end

	def display
		puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    	puts "-----------"
    	puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    	puts "-----------"
    	puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(input)
    	t = input.to_i - 1
    	self.cells[t]
    end

    def full?
    	!self.cells.include?(" ") ? true : false
    end

    def turn_count
    	turns = self.cells.count("X") + self.cells.count("O")
    end

    def taken?(input)
    	position(input) != " " ? true : false
    end

    def valid_move?(input)
    	(1..9).include?(input.to_i) && !(taken?(input))
    end

    def update(input, player)
    	index = input.to_i - 1
    	@cells[index] = player.token
    end

end
