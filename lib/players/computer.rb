module Players
  class Computer < Player
    def move(board)
      
      board.cells.each.with_index do |cell, i|
        if cell == " "
          return i + 1
        end
      end
    end
  end
end