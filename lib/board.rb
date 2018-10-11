require 'pry'
require_relative '../config/environment.rb'

class Board 
=begin
-Represend the data and logic of the Tic-tac-toe game board.
-We keep track of board position values with :cells 
=end 
  
  attr_accessor :cells 
  
  
  def initialize
    self.reset! 
  end 
  
  def reset!
    @cells = Array.new(9, " ")
  end 

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 


  def position(user_input)
    index = user_input.to_i - 1 
    @cells[index]
  end 
  
  def full?
     true if cells.include?(" ") == false 
  end 
    
  def turn_count
    @cells.count{|cell| cell != " "}
  end 
  
  def taken?(val)
    index = val.to_i- 1 
    if cells[index] == " "
      false
    else 
      true 
    end 
  end 
  
  def valid_move?(user_input)
    input = user_input.to_i
    if (1..9).include?(input) && taken?(user_input) == false 
      true 
    else
      false 
    end 
  end 
  
  def update(player_input, player)
    cells[player_input.to_i - 1] = player.token 

  end 
  
end 