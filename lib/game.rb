#require 'spec_helper'

class Game

  attr_accessor :board, :player_1, :player_2, :winner, :user_input

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6] ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @board.display
  end

  def current_player
     board.turn_count.odd? ? player_2 : player_1
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board.cells[combination[0]] == @board.cells[combination[1]] &&
      @board.cells[combination[0]] == @board.cells[combination[2]] &&
      @board.taken?(combination[0] + 1)
    end
  end

  def draw?
    @board.full? && !won? ? true : false
  end

  def over?
     (won? || draw?) ? true : false
     # IF board is not full, game is in progress (FALSE), ELSE, game is over (TRUE)
  end

  def winner
    if won = won?
      board.cells[won.first]
    end
  #   If won? returns true, then and only then will the local variable won be assigned,
  #   otherwise, the method will just abort with a false return value.
  #   But if won is assigned, we can use that variable instead of calling won? again within the if statement.
  end

  def turn
    puts "Please enter a number 1-9:"
    @user_input = current_player.move(@board)
    if @board.valid_move?(@user_input)
      @board.update(@user_input, current_player)
    else puts "Please enter a number 1-9:"
      @board.display
      turn
    end
    @board.display
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


end
