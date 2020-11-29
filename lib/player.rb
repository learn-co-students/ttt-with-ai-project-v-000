class Player
  attr_reader :token

  def initialize(token)
    @token = token
    #token - cannot be changed once assigned in initialize
  end
end
