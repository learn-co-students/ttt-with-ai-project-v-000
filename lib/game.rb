require 'pry'

class Game

	attr_accessor  :board, :player_1, :player_2

	#defines a constant WIN_COMBINATIONS with arrays for each win combination
	WIN_COMBINATIONS = [ [0,1,2], #top row
                     	 [3,4,5], #middle row
                       [6,7,8], #bottom row
                       [0,3,6], #left column
                       [1,4,7], #center column
                       [2,5,8], #right column
                       [0,4,8], #left diagonal
                       [6,4,2]  #right diagonal
                   ]

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
    if board.turn_count % 2 == 0 then 
      current_player = @player_1
    else
      current_player = @player_2
    end
  end

  def over?
    draw? || won? 
  end

  def won?
    #Game::WIN_COMBINATIONS.any? {|win_combination| #returns true or false
     # @board.cells[win_combination[0]] == @board.cells[win_combination[1]] &&
      #@board.cells[win_combination[1]] == @board.cells[win_combination[2]] &&
      #@board.taken?(win_combination[0])}
      if winner_array != nil then
          true
      else
          false
        end
      #winner ? true : false
  end

  def draw?
    !won? && board.full?
  end

  def winner_array #returns array of winning cells
    Game::WIN_COMBINATIONS.detect {|win_combination|
      (board.cells[win_combination[0]] == board.cells[win_combination[1]]) &&
      (board.cells[win_combination[1]] == board.cells[win_combination[2]]) &&
      board.taken?(win_combination[0])} 
  end

  def winner 
    if winner_array
      @winner = board.cells[winner_array.first] 
    end
  end

  def turn
    input = self.current_player.move
    if !board.valid_move?(input)
      puts "invalid"
      turn
    end
    board.update(input, current_player)
    current_player
  end
  	#makes valid moves,asks for input again after a failed validation
  	#changes to player 2 after the first turn

  def play
    while !over?
      turn
      board.display
    end
    if draw? 
      puts "Cats Game!" 
    elsif won?
      #binding.pry
      puts "Congratulations #{winner}!" 
    end
  end
      
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
  
  def start
    puts "Welcome to Tic Tac Toe"
    puts "How many players for this game: 0, 1, 2?"
    puts 'Who will go first and be "X"?'
  end


end
