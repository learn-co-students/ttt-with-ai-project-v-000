module Players
  class Computer < Player

    def move(board)
      #Pick a random square to move to
      board.get_valid_moves.sample.to_s
    end

  end
end
