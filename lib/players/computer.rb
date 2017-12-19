require 'pry'

module Players
  class Computer < Player
    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]

    def move(board)
      if !board.taken?(5)           #aim for center spot first
        "5"
      #  binding.pry
    #  elsif !board.taken?(1) || !board.taken?(3) ||!board.taken?(7) ||!board.taken?(9)   #aim for corner spot next
      #  "#{[1,3,7,9].sample}" #corners
      end
    end
  end
end
