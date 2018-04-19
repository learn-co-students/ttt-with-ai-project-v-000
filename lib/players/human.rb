module Players

class Human < Player
  attr_reader :token
  
  def initialize(token)
    @token = token 
  end 
  
def move(board)
    input = gets.strip
    input
   end 
  
end 

end 