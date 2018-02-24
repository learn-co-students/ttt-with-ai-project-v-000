class Player
  attr_accessor :game
  attr_reader :token, :player_1, :player_2

  def initialize(token, game = nil)
    @token = token
    @game = game if game != nil 
  end

end
