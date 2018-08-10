
module Players
  class Computer < Player

    def move(board)
      sleep(1.5)
      position = self.game.avail_moves.sample
      position
    end

  end
end
