module Players
  class Computer < Player
    def move(board)
      if !board.taken?("1")
        "1"
      end
    end
  end
end
