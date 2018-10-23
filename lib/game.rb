require 'pry'
require_relative './players/human.rb'

class Game
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  
  def initialize(player_1=Players::Human.new("X"), player_2 =Players::Human.new("O"), board = Board.new)
    @player_1= player_1
    @player_2= player_2
    @board= board
  end
  
  def current_player
    counter = 0
    @board.cells.each do |count|
      if count == "O" || count == "X"
      counter += 1
      end
    end
    if counter.even?
      @player_1
   elsif !counter.even?
      @player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = @board.cells[win_index_1]
    position_2 = @board.cells[win_index_2]
    position_3 = @board.cells[win_index_3]
    
      if  (position_1 == "X" || position_1 == "O") && position_1 == position_2 && position_1 == position_3
         return win_combination
      end     
    end
    return false
  end
  
  def draw?
    ongoing_game = @board.cells.any? {|cell| cell == " "}
    if !ongoing_game && !won?
      return "Cat's game!"
    end
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    
  end
  
end