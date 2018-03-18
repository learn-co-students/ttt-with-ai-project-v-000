module Computer
  class Computer < Player
    def move(board)
      if !board.taken == "1"
        move = "1"
      end
    end
  end
end
