module Players
  class Computer < Player

    def move(board)
      if board.position(5)
        return "5"
      end
    end

  end
end
