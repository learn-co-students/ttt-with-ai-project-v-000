module Strategies
  class Defend
    def decide_move(board)
      WIN_COMBINATIONS.detect do |combination|
        if board.cells[combination[0]] == board.cells[combination[1]] && board.cells[combination[0]] != " " && board.valid_move?(combination[2]+1)
          return combination[2]+1
        elsif board.cells[combination[0]] == board.cells[combination[2]] && board.cells[combination[0]] != " " && board.valid_move?(combination[1]+1)
          return combination[1]+1
        elsif board.cells[combination[1]] == board.cells[combination[2]] && board.cells[combination[1]] != " " && board.valid_move?(combination[0]+1)
          return combination[0]+1
        end
        board.cells.each_with_index do |cell, index|
          if cell == " "
            return index + 1
          end
        end
      end
    end
  end

  class Random
    def random_move(board)
      move = rand(1..9)
      until board.valid_move?(move)
        move = rand(1..9)
      end
      move
    end
  end
end
