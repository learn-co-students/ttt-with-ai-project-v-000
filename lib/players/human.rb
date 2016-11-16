module Players
  class Human < Player

    def move(board)
      # the board arg is completely useless here. I would prefer the
      # board to be an instance variable that gets assigned when
      # initialized by a Game, but oh well.
      gets.strip
    end
  end
end
