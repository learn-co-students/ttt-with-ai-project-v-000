require 'pry'
require_relative '../config/environment.rb'
class Game 
  attr_accessor :board, :player_1, :player_2  

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
    
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board 
  end
  
  def current_player
   if board.turn_count.even?
     @player_1
   else 
     @player_2
   end 
  end 
  
  def won?
    valid_token = "X" || "O"
    WIN_COMBINATIONS.detect do |combo|
      combo[0] == combo[1] && combo[1] == combo[2] && combo[0] == valid_token
    end 
    end 
  end 
  
end 