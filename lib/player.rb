class Player
  attr_reader :token
  def initialize(player_token)
    @token = player_token
  end
  def token
    @token
  end
end
