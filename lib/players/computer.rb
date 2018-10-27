require_relative '../player.rb'

module Players
  class Computer < Player
    
     def move(board)
       position = rand(0..8)
      if board.valid_move?(position)
        position.to_s
      else
        move(board)
      end
    end
    
  end
endubm