class Player
  attr_accessor :game
  attr_reader :token

  def initialize(token, game = nil)
  	@token = token
  	@game = game
  end

end
