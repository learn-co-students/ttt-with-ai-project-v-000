require 'pry'
class Computer < Player
#  attr_reader :token

 # def initialize(token)
  #  @token = token
 # end

  def move(board)
   input = (1 + rand(9)).to_s

   if board.valid_move?(input) == false
    self.move
  else
    return input
  end
  end
end