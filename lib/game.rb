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

  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
  	self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  	#accepts two players and a board
  	#defaults to two human players, X and O, with an empty board
  end

  def current_player
  	#returns the correct player for the third move
    #so if board has 4 spots filled, it is the 5th turn
    if board.turn_count % 2 == 0 then 
      current_player = self.player_1
    else
      current_player = self.player_2
    end
  end

  def over?
    draw? || won? 
  end

  def won?
    Game::WIN_COMBINATIONS.any? {|win_combination| #returns true or false
      @board.cells[win_combination[0]] == @board.cells[win_combination[1]] &&
      @board.cells[win_combination[1]] == @board.cells[win_combination[2]] &&
      @board.taken?(win_combination[0] + 1)}
  end

  def draw?
    !won? && board.full?
  end

  def winner 
    if won?
      winner_array = Game::WIN_COMBINATIONS.select {|win_combination|
        (board.cells[win_combination[0]] == board.cells[win_combination[1]]) &&
        (board.cells[win_combination[1]] == board.cells[win_combination[2]]) &&
        board.taken?(win_combination[0] + 1)} 
        winner_array
        board.cells[winner_array.first.first]      
    end
  end

  def turn
    input = current_player.move
    puts "#{current_player}"
    #binding.pry
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
    if won?
      puts "Congratulations #{winner}!"  
    elsif draw?
      puts "Cats Game!"      
    end
  end
      
  	
end
