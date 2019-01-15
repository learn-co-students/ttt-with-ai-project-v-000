class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def move(board)
    puts "Please enter 1-9"
    input = gets.strip
  end
end
