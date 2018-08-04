class Player
  attr_reader :token
  
  def initialize(token)
    @token = token 
  end 
  
  def move(board)
    raise NotImplementedError.new("You must implement the move method!")
  end
end 