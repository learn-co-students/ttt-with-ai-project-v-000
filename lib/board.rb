class Board
	attr_accessor :cells
	def initialize
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
	end

	def reset!
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
	end

	def display
		puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
		puts "-----------"
		puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
		puts "-----------"
		puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
	end

	def position(argument)
		@cells[argument.to_i-1]
	end

	def full?
		@cells.all?{|cell| cell == " " ? false : true}
	end

	def turn_count
		counter = 0
    @cells.each do |n|
      if n == "X" || n == "O"
        counter += 1
      end
    end
    counter
	end

	def taken?(arg)
		if @cells[arg.to_i-1] == "X" || @cells[arg.to_i-1] == "O"
			true
		elsif @cells[arg.to_i-1] == "" || @cells[arg.to_i-1] == " "
			false
		end
	end

	def valid_move?(arg)
		true if arg.to_i.between?(1,9) && !taken?(arg)
	end
	def update(index, player)
		@cells[index.to_i-1] = player.token
		# binding.pry
	end
end
