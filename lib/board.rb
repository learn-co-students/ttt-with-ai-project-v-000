require 'pry'
class Board
  attr_accessor :cells
  
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  def display
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 
  
  def position(input)
    user_input = input.to_i - 1 
    @cells[user_input]
  end 

  def full?  
    @cells.all?{|index| index == "X" || index == "O"}
  end 
  
  def turn_count
     @cells.count{|index| index == "X" || index == "O"}
  end 
  
  def taken?(input)
    user_input = input.to_i - 1 
    @cells[user_input] == "X" || @cells[user_input] == "O"
  end     
  
  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end 
  
  def update(index, player)
    @cells[index.to_i - 1] = player.token
  end
end 