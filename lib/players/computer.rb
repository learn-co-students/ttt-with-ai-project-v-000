module Players
  class Computer < Player
   
  def move(board)
    choices = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    choices.sample.to_s
    
    
    
    
    #puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    #puts "-----------"
    #puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    #puts "-----------"
    #puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 
  
  end 
end 