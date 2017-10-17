class Player

  attr_reader :token

  #initialize accepts a token to assign
  #token cannot be changed once assigned in initialize

  def initialize(token)
    @token = token
  end
end
