class Player

  attr_accessor :board, :game
  attr_reader :token

  def initialize(token)
    @token = token
  end

end