require 'pry'
module Players
  class Computer < Player
    #attr_accessor :board

    def move(board)
      input = (1..9).to_a.sample.to_s
      if !board.taken?(input.to_i)
        input
      else
        move(board)
      end
    end
  end
end
