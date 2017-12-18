module Players
  class Computer < Player

    def move(board)
      Game::WIN_COMBINATIONS.detect do |array|
        if board.cells[array[0]] == board.cells[array[1]]
          move = array[2]
        elsif board.cells[array[1]] == board.cells[array[2]]
          move = array[0]
        elsif board.cells[array[0]] == board.cells[array[2]]
          move = array[1]
        end
        move = move.to_s

      end

      if board.valid_move?(5)
        move =  "5"
      else move = [1,3,7,9].detect {|x| board.valid_move?(x)}
      end
    end

  end
end
