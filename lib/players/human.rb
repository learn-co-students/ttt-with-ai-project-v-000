require_relative '../player.rb'

module Players
  class Human < Player
  
    def move(board)
      if board == Board.new
        return "1"
      end
    end
  
  end
end