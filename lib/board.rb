class Board 
  require 'pry'
  attr_accessor :cells
  
  def initialize
    reset!
  end 
  
  
  def reset! 
    @cells = Array.new(9," ") 
  end 
  
  def display 
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end 
  
  def position(input)
    cells[input.to_i-1]
  end 
  
  def full? 
    cells.all? do |character| 
    if character == "X" || character == "O"
      true
     else 
       false
    end 
  end 
end 

  def turn_count
  cells.count{ |char| char == "X" || char == "O"}
 
  end 
  
  def taken?(input)
    
    position(input) == "X" ||  position(input) == "O"
    
    # !(position(input)==" " ||  position(input)=="")   #Also passes
  end 


  
  
  
  
end 