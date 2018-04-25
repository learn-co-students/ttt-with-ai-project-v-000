module Players
  class Computer < Player

    def move(board)
      board.valid_move? == true
    end

  end
end
