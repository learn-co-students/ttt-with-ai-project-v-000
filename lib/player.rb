class Player
  attr_reader :token
  attr_accessor :game

  def initialize(token)
    @token = token
  end
end
