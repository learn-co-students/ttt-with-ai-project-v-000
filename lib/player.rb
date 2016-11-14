class Player
  # Cannot be changed once assigned in initialize.
  attr_reader :token

  def initialize(token)
    self.set_token = token
  end

  # Accepts a token to assign.
  def set_token=(token)
    @token = token
  end

end
