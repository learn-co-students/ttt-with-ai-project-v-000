class Player
  attr_reader :token, :player_order

  def initialize(token)
    @token = token.freeze
  end
end
