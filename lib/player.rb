class Player
  attr_reader :token, :player_order

  # Creates a new player and sets their token.
  def initialize(token)
    @token = token.freeze
  end

end # end class Player
