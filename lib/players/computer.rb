class Players
  class Computer < Player

    def move(board)
      move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
  end

  end
end
