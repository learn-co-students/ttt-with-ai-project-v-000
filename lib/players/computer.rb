require 'pry'

module Players
  class Computer < Human
    attr_accessor :board

    def move(board)
      if board.cells[4] == " "
        5.to_s
      elsif corner_pick(board) != nil
        corner_pick(board) + 1
      elsif other_pick(board) != nil
        other_pick(board) + 1
      end
    end

    def corner_pick(board)
      corners = [0, 2, 6, 8]
      corners.detect do |corner|
        board.cells[corner] == " "
      end
    end

    def other_pick(board)
      others = [1, 3, 5, 7]
      others.detect do |other|
        board.cells[other] == " "
      end
    end
  end
end
