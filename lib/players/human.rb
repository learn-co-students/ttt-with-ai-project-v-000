
class Player::Human < Player
  attr_accessor :move
  attr_reader :token
  
  def move(token)
    puts "Make your move, player #{token}."
    @move = gets.strip
  end
    
  
end