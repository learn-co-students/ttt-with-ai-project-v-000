module Players
  class Computer < Player
   
  def move(board)
    choices = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    choices.sample.to_s
  end 
  
  end 
end 