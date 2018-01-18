require 'pry'
class Game

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # bottom row
    [0,3,6],  # left column
    [1,4,7],  # Middle column
    [2,5,8],  # right column
    [0,4,8],  # cross left
    [2,4,6]  # cross right
  ]

  attr_accessor :board, :player_1, :player_2, :wargame, :winner
  @winner = ""
  @wargame = false

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  	
  	@player_1 = player_1
  	@player_2 = player_2
  	@board = board
  end

  def current_player
  	@board.turn_count%2 ==0 ? @player_1 : @player_2
  end

  def won?
  	  WIN_COMBINATIONS.any? do |combo|
		  if @board.cells[combo[0]] != " " && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[0]] == @board.cells[combo[2]]
		  	@winner = @board.cells[combo[0]]
		  	return true
		  end
	  end #end of nested array
  end #end of method

  def winner
  	won? ? @winner : nil
  end

  def draw?
  	!won? && @board.full?
  end

  def over?
  	won? || draw? || @board.full?
  end

  def turn
  	input_1 = current_player.move(@board).to_i
  	while !@board.valid_move?(input_1) #keep asking input if not valid
  		input_1 = current_player.move(@board).to_i 
  	end
  	puts "#{current_player.name}'s move" if !@wargame
  	@board.update(input_1, current_player)
  	@board.display if !@wargame
  end

  def play
  	until over?
  		turn
  	end

  	if won?
  		puts "Congratulations #{winner}!"
  	elsif draw?
  		puts "Cat\'s Game!"
  	end
  end




end
