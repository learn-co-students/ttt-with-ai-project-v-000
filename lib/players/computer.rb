module Players
  class Computer < Player
    def move(board)
      
      board.cells.collect.with_index do |cell, i|
        if cell == " "
          return (i + 1).to_s
        end
      end
    end
  end
end