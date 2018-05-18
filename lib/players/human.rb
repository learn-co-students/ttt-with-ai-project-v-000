require 'pry'

module Players
  class Human < Player

    def move(board)
       gets.strip
    end

  end

  class Computer < Player

    def move(board)
      valid_moves = []
      board.cells.each_with_index do |space,index|
        if space != "X" || space != "O"
          valid_moves << space = "#{index + 1}"
        end
      end
      valid_moves.sample
    end

  end
end
