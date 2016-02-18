class Board

	attr_accessor :cells, :token, :position

	#has an attribute to store the cells of the board
	def cells
		@cells
	end

	#can reset the state of the cells in the board
  #sets the cells of the board to a 9 element array of " "
	def reset!
		@cells = Array.new(9, " ")
	end

	#sets the cells of the board to a 9 element array of " "
	def initialize(cells=nil)
		reset!
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
  def position(input)
  	array_index = input.to_i - 1
  	@cells[array_index]
    #@cells[input.to_i - 1]
  end

	#returns true for a full board
	def full?
  	@cells.all?{|token| token == "X" || token == "O"}
	end

	#returns the amount of turns based on cell value
  def turn_count  
		@cells.count {|c| c != " "}
	end

	def taken?(input)
		(position(input) == "X" || position(input) == "O") ? true : false
		#(@cells[input.to_i - 1] == "X" || @cells[input.to_i - 1] == "O") ? true : false
		#returns true if the position is X or O
		#returns false if the position is empty or blank
	end

	def valid_move?(input)
		input.to_i.between?(1, 9) && !taken?(input)
		#returns true for user input between 1-9 that is not taken
	end

	def update(input, player)
		#binding.pry
		#position(input) = player.token
		@cells[input.to_i - 1] = player.token
		#updates the cells in the board with the player token according to the input
	end

	


end