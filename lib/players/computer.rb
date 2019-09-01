require_relative '../player.rb'

class Players 
  
  class Computer < Player
    
    def move(board)
      r = Random.new
      randomMove = r.rand(1...10) 
      board.valid_move?(randomMove) ? randomMove.to_s : move(board)
    end
    
  end
end