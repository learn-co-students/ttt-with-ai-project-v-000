
class Human < Player
<<<<<<< HEAD

  def move(token)
    "Player #{token}, where do you wanna move?"
    move = gets.strip
=======
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
>>>>>>> game
  end
    
  
end