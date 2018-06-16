module Players
  class Computer < Player

    def move(board)
      board.cells.map.with_index { |cell, i|
        cell == " " ? i.to_s : nil
      }.sample(1).join
    end

  end
end
