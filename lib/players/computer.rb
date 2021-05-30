require 'pry'
module Players
  class Computer < Player

    def move(board)
      (1 + rand(9)).to_s
    end
  end
end