class Player
  attr_reader :token
  
  def initialize(token)
    @token = token
  end

  def move(board)
    puts "Where do you want to move? Please choose a number 1-9."
    input = gets.strip
  end
end
