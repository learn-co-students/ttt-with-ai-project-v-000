
module Players
  class Human < Player

    def move(board)
      position = gets
      board.update(position, self)
      position
    end

  end
end
