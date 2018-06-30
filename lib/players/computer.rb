module Players
  class Computer < Player
    def move(board)
      next_move = nil
      opponent_token = nil
      if self.token == "X"
        opponent_token = "O"
      else
        opponent_token = "X"
      end

      Game::WIN_COMBINATIONS.detect do |combo|
        if board.cells[combo[0]] == self.token && board.cells[combo[1]] == self.token && !board.taken?(combo[2]+1)
          next_move = combo[2]+1
        elsif board.cells[combo[0]] == self.token && board.cells[combo[2]] == self.token && !board.taken?(combo[1]+1)
          next_move = combo[1]+1
        elsif board.cells[combo[1]] == self.token && board.cells[combo[2]] == self.token && !board.taken?(combo[0]+1)
          next_move = combo[0]+1
      elsif board.cells[combo[0]] == opponent_token && board.cells[combo[1]] == opponent_token && !board.taken?(combo[2]+1)
          next_move = combo[2]+1
        elsif board.cells[combo[0]] == opponent_token && board.cells[combo[2]] == opponent_token && !board.taken?(combo[1]+1)
          next_move = combo[1]+1
        elsif board.cells[combo[1]] == opponent_token && board.cells[combo[2]] == opponent_token && !board.taken?(combo[0]+1)
          next_move = combo[0]+1
        end
      end

      if !next_move
        if !board.taken?(5)
          next_move = "5"
        elsif !board.taken?(1)
          next_move = "1"
        elsif !board.taken?(3)
          next_move = "3"
        elsif !board.taken?(7)
          next_move = "7"
        elsif !board.taken?(9)
          next_move = "9"
        elsif !board.taken?(2)
          next_move = "2"
        elsif !board.taken?(4)
          next_move = "4"
        elsif !board.taken?(6)
          next_move = "6"
        elsif !board.taken?(8)
          next_move = "8"
        end
      end
      next_move
    end
  end
end
