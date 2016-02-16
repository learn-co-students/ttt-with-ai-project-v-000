require 'pry'

class Game

	attr_accessor  :board, :player_1, :player_2, :cells, :token

	#defines a constant WIN_COMBINATIONS with arrays for each win combination
	WIN_COMBINATIONS = [ [3,4,5], #top row
                     	 [0,1,2], #middle row
                       [6,7,8], #bottom row
                       [0,3,6], #left column
                       [1,4,7], #center column
                       [2,5,8], #right column
                       [0,4,8], #left diagonal
                       [6,4,2]  #right diagonal
                   ]

  def board
  	@board 
  	#provides access to the board
  end

  def player_1
  	@player_1
  	#provides access to player_1
  end

  def player_2
  	@player_2
  	#provides access to player_2
  end

  def initialize(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new)
  	@player_1 = player_1
    @player_2 = player_2
    @board = board
  	#accepts two players and a board
  	#defaults to two human players, X and O, with an empty board
  end

  def current_player
  	#returns the correct player for the third move
    #so if board has 4 spots filled, it is the 5th turn
    if @board.turn_count % 2 == 0 then 
      player_1
    else
      player_2
    end
  end

  def over?
    draw? || won? 
  end

  def won?
    Game::WIN_COMBINATIONS.any? {|win_combination| #returns true or false
      @board.cells[win_combination[0]] == @board.cells[win_combination[1]] &&
      @board.cells[win_combination[1]] == @board.cells[win_combination[2]] &&
      @board.taken?(win_combination[0])}
  end

  def draw?
    !won? && @board.full?
  end

  def winner_array #returns array of winning cells
    Game::WIN_COMBINATIONS.detect {|win_combination|
      @board.cells[win_combination[0]] == @board.cells[win_combination[1]] &&
      @board.cells[win_combination[1]] == @board.cells[win_combination[2]] &&
      @board.taken?(win_combination[0])}   
  end

  def winner
    if winning_combo = winner_array
      @winner = @board.cells[winning_combo.first]
  end

  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    binding.pry
    if @board.cells.valid_move?(input) != true
      puts "invalid"
    end
    @board.cells.update(input, @current_player)
  end
  	#makes valid moves
  	#asks for input again after a failed validation
  	#changes to player 2 after the first turn

  def play
  	#asks for players input on a turn of the game
  	#checks if the game is over after every turn
  	#plays the first turn of the game
  	#plays the first few turns of the game
  	#checks if the game is won after every turn
  	#stops playing if someone has won
  	#congratulates the winner X
  	#congratulates the winner O
  	#stops playing in a draw
  	#prints "Cats Game!" on a draw
  	#plays through an entire game
  end

  def start
  end


end
