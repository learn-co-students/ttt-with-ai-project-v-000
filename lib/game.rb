
require 'pry'
require_relative "./players/human.rb"
require_relative "./players/computer.rb"

class Game
  
#  extend Players::Human

  attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]    
    
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board=Board.new)
    @player_1 = player_1 if player_1
    @player_2 = player_2 if player_2
    @board = board if board
  end

  def turn_count
    @board.cells.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? @player_1 : @player_2
    # @player_1 is the "X" player
  end
  
  def won?
    # returns the winning combination
    # detect returns the combination if entries have met them
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.cells[combo[0]] != " "
    end
  end

  def full?
    @board.cells.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combo = won?
      @board.cells[winning_combo.first]
      # looks for the first index of winning combo. [0,4,8].first will be 0, [3,4,5].first will be 3.
    end
  end

  def move(move, token)
    @board.cells[move.to_i - 1] = token
  end

  def turn
    input = current_player.move(@board)
    if board.valid_move?(input) 
      move(input, current_player.token)
      board.display
      input
      #binding.pry
    else
      "invalid"
      turn
    end
  end  
  
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end

