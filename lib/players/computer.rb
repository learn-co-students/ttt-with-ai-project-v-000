require "pry"
module Players
  attr_accessor :board, :game, :player
  class Computer < Player
    
    def move(board)
      #puts board
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
      else
        board.cells.each_with_index do |cell, index| 
          #binding.pry           
          if cell == " "
            return index+1   
          end
        end
      end
    end
  end
end