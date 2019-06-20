module Players
  class Computer < Player

    def move(game)
      TTTAI::Decider.new(game, self).valid_move
    end
  end
end#endof Module
