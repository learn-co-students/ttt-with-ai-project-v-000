require 'pry'

class Game
  attr_accessor :player_1, :player_2, :winner, :board
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @winner = nil
  end 
  
  def current_player
    if @board.turn_count.even?
      player_1
    else 
      player_2
    end 
  end
  
  def won?
    winning_combo = false 
    WIN_COMBINATIONS.each do |current_combo|
      if @board.cells[current_combo[0]] == "X" && @board.cells[current_combo[1]] == "X" && @board.cells[current_combo[2]] == "X"
        @winner = "X"
        winning_combo = current_combo
      end 
    end
   WIN_COMBINATIONS.each do |current_combo|
     if @board.cells[current_combo[0]] == "O" && @board.cells[current_combo[1]] == "O" && @board.cells[current_combo[2]] == "O"
        @winner = "O"
        winning_combo = current_combo
      end 
    end
    #binding.pry
    winning_combo
  end 
  
  def over?
    @board.full?
  end 
  
end 