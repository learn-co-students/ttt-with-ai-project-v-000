class Player
  attr_accessor :player_1, :player_2, :board
  attr_reader :token

  def initialize(token)
    @token = token
  end

end
