module Players
  class Computer < Player
    def move(board = nil)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      corners = ["1", "3", "7", "9"]
    end
  end
end
