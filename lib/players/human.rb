
class Human < Player
  attr_accessor :move
  attr_reader :token
  
  def move(token)
    puts "Make your move, player #{self.token}."
    @move = gets
  end
    
  
end