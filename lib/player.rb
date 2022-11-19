class Player
  attr_reader :token #To allow the token to be only set once at initialize and not by any other method after

  #Initializes a new game with a token
  def initialize(token)
    @token = token
  end
end
