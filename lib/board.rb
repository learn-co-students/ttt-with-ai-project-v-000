class Board

	attr_accessor :cells, :token, :player

	def initialize
		reset!
	end

	def reset!
		#How the board looks at the start of a game
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	def display
		puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
		puts "-----------"
		puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
		puts "-----------"
		puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
	end

	def position(position)
		#gets user input through argument
		#looks up the value
		cells[position.to_i-1]
	end

	def turn_count
		#keeps track of the number of moves that have been played
		counter = 0
		cells.each do |count|
			if count == "X"
				counter +=1
			elsif count == "O"
				counter +=1
			end
		end
		counter
	end

	def update(position, player)
		#updates the board by position
		#fills it with the current player's token
		cells[position.to_i-1] = player.token
	end

	def full?
		#returns true if the board is full
	cells.all? {|check| check == "X" || check == "O"}
	end

	def taken?(position)
		#returns true/false for a specific positon on the board
		if cells[position.to_i-1] == "X"
			return true
		elsif cells[position.to_i-1] == "O"
			return true
		elsif cells[position.to_i-1] == " "
			return false
		end
	end

	def valid_move?(position)
		#true if it is on the board and is not #TAKEN
		position.to_i.between?(1,9) && !taken?(position)
	end

  def get_cells(array)
    array.map{ |x| x = @cells[x] }
  end
end
