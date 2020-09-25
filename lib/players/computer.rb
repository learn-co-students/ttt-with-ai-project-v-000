require_relative '../../config/environment.rb'
module Computers
  class Computer < Player

    def move(board)
      valid_move = []
      board.cells.each_with_index do |cell, index|
        if cell == " "
          valid_move << (index + 1)
        end
      end
      valid_move[0].to_s
    end
  end
end #end of Module
