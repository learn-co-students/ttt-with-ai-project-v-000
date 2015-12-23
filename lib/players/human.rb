
class Human < Player

  def move(token)
    "Player #{token}, where do you wanna move?"
    move = gets.strip
  end
    
  
end