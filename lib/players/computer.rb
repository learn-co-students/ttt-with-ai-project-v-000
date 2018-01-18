require 'pry'

module Players
  class Computer < Player

    def move(board)

      if !board.taken?(5)
        '5'
      elsif !board.taken?(3)
        '3'
      elsif !board.taken?(7)
        '7'
      else
        ['1','2','4','6','8','9'].sample
      end
    end
  end

end
