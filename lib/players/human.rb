require_relative '../player.rb'

module Players
  class Human < Player
  
    def move(board)
      puts board
    end
  
  end
end