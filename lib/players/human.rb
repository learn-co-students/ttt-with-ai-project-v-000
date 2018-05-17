require 'pry'

module Players
  class Human < Player

    def move(board)
       gets.strip
    end

  end

  class Computer < Player

    def move(board)
      moves = board.cells.reject {|space| space == "X" || space == "O"}
      valid_moves = []
      moves.each_with_index do |space, index|
        valid_moves << "#{space = index + 1}"
      end
        valid_moves.sample
    end
  end
end
