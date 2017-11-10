module Players
  class Computer < Player
    def move(board)
      #AI's moves
      move = nil


      if !board.taken?(5)
        move = "5"
          # go in the middle if empty
      else
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
        # go corners, then sides
      end
      move
    end
  end
end
