class Player
  attr_reader :token #token cannot be changed once assigned in initialize

  def initialize(token)
    #accepts a token to assign
    @token = token
  end
end
