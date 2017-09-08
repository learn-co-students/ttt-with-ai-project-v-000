module Players
  class Computer < Player

    def move(board)
      win_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
      move = nil
      if !move && win_combinations.any? {|win|

      end

    end

  end
end
