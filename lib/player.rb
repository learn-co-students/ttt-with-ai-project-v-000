class Player
  attr_reader :token, :game

  def initialize(token, game=nil)
    @token = token
    @game = game
  end
end
