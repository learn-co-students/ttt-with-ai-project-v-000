require 'pry'
module Players
  class Computer < Player
    def move(board)
      # binding.pry
      rand(1..8).to_s
    end
  end
end
