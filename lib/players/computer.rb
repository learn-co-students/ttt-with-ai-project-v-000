require 'pry'

module Players
  class Computer < Player

    attr_reader :computer_move

    def move(board)
      sleep(1)
      # ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
      if board.cells[4]== " "
          "5"
        elsif board.cells[0] == " " || board.cells[2] == " " || board.cells[6] == " " || board.cells[8] == " "
          ["1", "3", "7", "9"].sample
        else
          ["2", "4", "6", "8"].sample
        end
    end

  end
end
