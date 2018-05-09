module Players
  class Human < Player
  
  def move(board)
    p "What's your move?"
    @input = gets.strip 
  end
  
  
  end
end
