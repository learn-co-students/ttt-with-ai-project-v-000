class Player::Computer < Player

  def move(board)
    if !board.taken?(middle)
    middle
      else
      comp_move(board)
    end
  end

  def comp_move(board)
    corners(board) || win_computer(board, self.token) || block(board, opponent_token) || random
  end

  def middle(board)
    if board.turn_count == 0
      board.cells[4] = "X"
    end
  end

  def corners(board)
    [0,2,6,8].detect {|corner| corner.nil?}
  end

  def win_computer(board, token)
        #put ur token in any of the winning_combinations
    Game::WIN_COMBINATIONS.detect do |combo|
      if board.cells[combo[0]] == self.token && board.cells[combo[1]] == self.token && !board.taken?(win_combination[2]+1) ||
         board.cells[combo[1]] == self.token && board.cells[combo[2]] == self.token && !board.taken?(win_combination[0]+1) ||
         board.cells[combo[2]] == self.token && board.cells[combo[0]] == self.token && !board.taken?(win_combination[1]+1)
      end
  end
end

    def block(board, opponent_token)
       Game::WIN_COMBINATIONS.detect do |combo|
      if board.cells[combo[0]] == opponent_token && board.cells[combo[1]] == opponent_token && !board.taken?(win_combination[2]+1) ||
         board.cells[combo[1]] == opponent_token && board.cells[combo[2]] == opponent_token && !board.taken?(win_combination[0]+1) ||
         board.cells[combo[2]] == opponent_token && board.cells[combo[0]] == opponent_token && !board.taken?(win_combination[1]+1)
      end
     end
    end

    def random
      ["0", "1", "2", "3", "4", "5", "6", "7", "8"].sample
    end

    def opponent_token
      if self.token == "X"
        @opponent_token == "O"
        elsif self.token == "O"
        @opponent_token == "X"
      end
    end

  end