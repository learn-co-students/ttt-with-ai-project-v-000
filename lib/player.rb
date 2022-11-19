class Player

  attr_reader :token

  def initialize(token)
    @token = token
  end

  def move(board)  # returns a board location (1..9)
    'OVERRIDE ME!'
  end
end
