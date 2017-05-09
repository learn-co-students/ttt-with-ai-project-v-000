class Player
  attr_accessor :current_board
  attr_reader :token

  def initialize(token)
    @token = token
  end
end
