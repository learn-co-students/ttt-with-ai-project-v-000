class Player
  attr_reader :token

  def initialize(token)
    # Creates a new player with a token of X or O
    @token = token
  end
end
