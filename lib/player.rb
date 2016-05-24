class Player
  attr_accessor :token

  def initialize(token)
    @token = token
  end

  def token
    @token #= "X" || @token = "O" 
  end

end