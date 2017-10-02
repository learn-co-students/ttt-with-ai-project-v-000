require "pry"
module Players
  class Computer < Player

    def move(board)
      if board.cells[4] == " "
        "5"
      elsif board.cells[0] == " "
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      elsif board.cells[rand(1..9)] == " "
        "#{rand(1..9)}"
      # else
      #   board.cells.each_with_index.detect {|index, cell| index == " "}[1].to_s

        # move(board)
      end
    end
    #make an else that places a token in the last space.
  end
end
