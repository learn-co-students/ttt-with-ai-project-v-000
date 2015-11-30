class Player
  attr_reader :token #No writer since player shouldn't change tokens mid-game

  def initialize(token)
    @token = token
  end
end