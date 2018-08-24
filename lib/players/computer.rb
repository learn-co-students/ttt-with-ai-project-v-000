module Players
  class Computer < Player

    def move(board)
      valid_indeces = []
      board.cells.each_with_index do |cell, index|
        if cell == " "
          valid_indeces << index
        end
      end
      valid_indeces.sample.to_s

    end
  end
end
