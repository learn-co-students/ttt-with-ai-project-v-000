class Player

  def initialize(player)
    @token = player
  end

  def token
    @token.dup.freeze
  end

end
