require_relative '../player.rb'

module Players
  class Computer < Player
    
     def move(board)
       position = rand(0..8)
      binding.pry
      if board.valid_move?(position)
        position.to_s
      else
        move
      end
    end
    
  end
end