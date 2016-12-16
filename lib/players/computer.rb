module Players
  class Computer < Player

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def move(board)
      return "5" if board.valid_move?("5")

      if self.token == "X"
        WIN_COMBINATIONS.each do |combo|
          if (combo - board.oes).size == 1
            block_move = ((combo - board.oes)[0] + 1).to_s
            return block_move if board.valid_move?(block_move)
          end
        end
      else
        WIN_COMBINATIONS.each do |combo|
          if (combo - board.exes).size == 1
          block_move = ((combo - board.exes)[0] + 1).to_s
          return block_move if board.valid_move?(block_move)
          end
        end
      end
      valid_moves = board.cells.collect.with_index do |cell, i|
        (i+1).to_s if cell == " "
      end
      valid_moves.sample
    end
  end
end
