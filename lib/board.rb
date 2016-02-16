class Board

	attr_accessor :cells, :token

	#has an attribute to store the cells of the board
	def cells
		@cells
	end

	#can reset the state of the cells in the board
   #sets the cells of the board to a 9 element array of " "
	def reset!
		@cells.clear
		@cells = Array.new(9, " ")
	end

	#sets the cells of the board to a 9 element array of " "
	def initialize(cells = nil)
		@cells = Array.new(9, " ")
	end

	# prints the board
	def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  #takes in user input and returns the value of the board cell 
  def position(position)
    @cells[position.to_i - 1]
  end

	#returns true for a full board
	def full?
  	@cells.all?{|token| token == "X" || token == "O"}
	end

  def turn_count
    #returns the amount of turns based on cell value
		@cells.count {|c| c != " "}
	end

	def taken?(position)
		#position=position.to_i - 1
		(@cells[position.to_i - 1] == "X" || @cells[position.to_i - 1] == "O") ? true : false
		#returns true if the position is X or O
		#returns false if the position is empty or blank
	end

	def valid_move?(position)
		position.to_i.between?(1, 9) && !taken?(position)
		#returns true for user input between 1-9 that is not taken
	end

	def update(position, player)
		@cells[position.to_i - 1] = player.token
		#updates the cells in the board with the player token according to the input
	end

end