#root class for basic properties that other classes will inherit
class Player
  attr_reader :token
  
  def initialize(token)
    @token= token
  end
  
  def move
  end
  
  
end