
class Human < Player
  attr_accessor :move
  attr_reader :token
  
  def move(token)
    puts "Make your move, player #{self.token}."
    @move = gets
    # if Board.valid_move?(move) 
    #   turn
    # else 
    #   "invalid"
    #   # @move = gets
    # end
  end
end