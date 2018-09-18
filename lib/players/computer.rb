module Players
  class Computer < Player

    def move(board)
      if board.valid_move?("5")
        "5"
      else
        move = rand(1..9)
        move.to_s
      end
    end
  end
end
