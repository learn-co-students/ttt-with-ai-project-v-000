class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def select
    puts "Player 1, would you like to be X or O?"
    @token = gets.strip
  end

end
