module Players
  class Computer < Player
    def move(board)
      move = nil

      # When going first, take the middle square. When going second, take the middle square if it isn't yet taken.
      if !board.taken?(5)
        move = "5"
      else
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move
    end
  end
end
