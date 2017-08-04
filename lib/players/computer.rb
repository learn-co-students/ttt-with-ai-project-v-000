module Players
  class Computer < Player

    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      random_move = valid_moves.sample

      if board.taken?(random_move) == false
        move = random_move
      end

    end
  end
end
