module Players
  class Computer < Player
    def move(board)
      (rand() * 9).floor.to_s
    end
  end
end
