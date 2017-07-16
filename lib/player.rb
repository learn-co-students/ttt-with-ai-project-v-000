class Player
  #inheritance point for other player classes:
  #  - Human < Player
  #  - Computer < Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

end
