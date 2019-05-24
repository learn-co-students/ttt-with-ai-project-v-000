require 'require_all'

module Players

class Computer < Player

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
    ]

  def move(board)
    if !board.taken?(5)
      "5"
    else
      [1, 2, 3, 4, 5, 6, 7, 8, 9].sample.to_s
    end
  end
end
end
