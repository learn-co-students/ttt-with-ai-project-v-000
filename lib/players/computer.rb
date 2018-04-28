require "pry"
module Players
  attr_accessor :board, :game, :player
  class Computer < Player
    
    def move(board)
      puts board
      if board.cells[4] == " "
        "4"
      elsif board.cells[0] == " "
        "0"
      elsif board.cells[2] == " "
        "2"
      elsif board.cells[6] == " "
        "6"
      elsif board.cells[8] == " "
        "8"
      else
        board.detect do |cell| 
          if cell.empty?
            return board.index(cell)
          end
        end
      end
    end
  end
end