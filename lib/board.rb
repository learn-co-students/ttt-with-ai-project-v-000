require 'pry'
class Board
  attr_accessor :cells
  
  def initialize
    reset!
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
  
  def position(user_input)
   input = user_input.to_i - 1
    @cells[input]
  end
  
  
  def full?
    @cells.any? do |cell|
      if cell == " "
        return false
      end
    end
      true
  end
  
  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end
  
  def taken?(position)
    index = position.to_i - 1
    if @cells[index] != "" && @cells[index] != " "
      true
    else
      false
    end 
  end
    
  
end