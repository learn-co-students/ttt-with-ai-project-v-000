# The root class
class Player 
  attr_reader :token # token cannot be changed once assigned

  def initialize(token)
    @token = token
  end
end
