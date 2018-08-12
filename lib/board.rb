require 'pry'
class Board
  
  attr_accessor :board, :cells
  
  def reset!
    @cells = Array.new(9, " ")
    #binding.pry
    # I was originally doing 
    #cells.clear
    #cells = Array.new(9, " ")
    #did this fail because I was calling on the cells object?  Class?  If I don't have an initialize method it's ok to use an instance var to perform the behavior?  I hope I'm even asking this question correctly.
  end
  
  def update(board, player)
    
  end
  
  def full?
    
  end
  
  def turn_count
    
  end
  
  def taken?
    
  end
  
  def valid_move?
    
  end
  
end