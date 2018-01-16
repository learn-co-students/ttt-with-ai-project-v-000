class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def move(board)
    input = gets.chomp
    input
  end
end
