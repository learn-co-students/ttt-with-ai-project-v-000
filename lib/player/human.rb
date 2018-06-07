module Players
  
class Human < Player
  attr_accessor :board
  
  def move(board)
    input=gets.strip
  end
end
end
