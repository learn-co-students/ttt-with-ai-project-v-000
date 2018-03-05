require 'pry'

module Players

  class Computer < Player

    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]

    def move(board)
      input = nil
      corners = [5, 1, 3, 7, 9, 2, 4, 6, 8]
      corners.detect do |corner|
        if !board.taken?(corner)
          input = corner
        end
      end
      input.to_s

    end




  end
end
