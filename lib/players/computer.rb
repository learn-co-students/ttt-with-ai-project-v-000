module Players
  class Computer < Player
    def move(board)
      #Computer will randomly choose a valid move. This is just to test the game.
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      valid_moves.sample
    end
  end
end
