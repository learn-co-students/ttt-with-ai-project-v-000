class Player
  attr_accessor :game, :turn_value
  attr_reader :token

  def initialize(token)
    @token = token
  end

end
