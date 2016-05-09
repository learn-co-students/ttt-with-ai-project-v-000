class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end
end

class Human < Player
  def move(board)
    input = gets.strip
    input
  end
end
