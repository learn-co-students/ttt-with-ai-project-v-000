class Board 
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
  
  
  
  
  
  
end 