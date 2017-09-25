require 'pry'

module Players
  class Computer < Player

    def move(board)
      valid_cells = []

      board.cells.each.with_index do |cell, index|
        if cell == " "
          valid_cells << "#{index + 1}"
        end
      end
      input = valid_cells.sample

    end
  end
end
