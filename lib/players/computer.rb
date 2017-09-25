require 'pry'

module Players
  class Computer < Player

    def move(board)
      # iterate over board.cells to check which are blank
      # if blank, add the index to my collection
      # using my collection, get a sample and use its index number to convert to a string number referencing the board numbers #1-9


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
