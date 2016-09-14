class Player

  attr_reader :token

#intializes Player object with a token, and prevents the token from being changed after initialization
  def initialize(token) 
    self.token_set = token
  end

  def token_set=(token)
    @token = token
  end

end
