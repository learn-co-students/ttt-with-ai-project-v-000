require_relative '../player.rb'

module Players
  class Computer < Player
    
     def move(position)
      position = rand(1..9)
      if valid_move?(position)
        position
      end
    end
    
  end
end