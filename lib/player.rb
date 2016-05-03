class Player
  attr_reader :token
  
  def initialize(token)
  @token = token
  end

  def move(pos)
    puts "where would you like to move?"
    pos = gets
  end
end