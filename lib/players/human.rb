module Players
  class Human < Player
    def move(board)
      input = gets.strip
    end
  end

  class Computer < Player
    def move(board)
    valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    valid_moves.sample
    end
  end
end
