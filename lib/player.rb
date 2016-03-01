class Player

  # cannot be changed once assigned in initialize
  attr_reader :token

  # accepts a token to assign
  def initialize(token)
    @token = token
  end

end