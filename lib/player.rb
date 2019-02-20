class Player
  
  attr_reader :token 
  
  def initialize(token) 
    # token "X" or "O"
    @token = token
  end

end


# Player.new("X")  Player.new("O")