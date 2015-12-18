require 'pry'

class Game

  WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Vertical row
  [1,4,7],  # Vertical Middle row
  [2,5,8],  # Vertical row
  [0,4,8],  # Diagonal Row
  [6,4,2]   # Diagonal Row
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end 

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def other_player
    board.turn_count.odd? ? player_2 : player_1
  end

  def over?
    board.full? || won? || draw?
  end 

  def won?
    WIN_COMBINATIONS.detect do |combo| 
    combo.all? {|location| board.cells[location] == "X" } || combo.all? {|location| board.cells[location] == "O" }
    end
  end 

  def draw?
    board.full? && !won?
  end

  def winner
    won? ? board.position(won?[0] + 1) : nil 
  end  

  def turn
    input = current_player.move(board)
    board.valid_move?(input) ? board.update(input, current_player) : turn
  end

  def play
    until over?
      turn 
    end 
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cats Game!" 
    end 
  end
end