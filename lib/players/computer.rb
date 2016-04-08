class Player::Computer < Player

  def move(board)
    (best_move(board) + 1).to_s
  end

  def best_move(board)
    win(board) || block(board) || center(board) || random
  end

  def win(board)
    combo(board, @token)
  end

  def block(board)
    combo(board, opponent_token)
  end

  def center(board)
    if !board.taken?(5)
      4
    end
  end

  def combo(board, token)
    combination = Game::WIN_COMBINATIONS.detect do |combination|
      (board.cells[combination[0]] == board.cells[combination[1]] && board.cells[combination[0]] == token && !board.taken?(combination[2] + 1)) ||
      (board.cells[combination[1]] == board.cells[combination[2]] && board.cells[combination[1]] == token && !board.taken?(combination[0] + 1)) ||
      (board.cells[combination[0]] == board.cells[combination[2]] && board.cells[combination[0]] == token && !board.taken?(combination[1] + 1))
    end

    if combination
      combination.detect {|index| !board.taken?(index + 1)}
    else
      nil
    end
  end

  def opponent_token
    @token == "X" ? "O" : "X"
  end

  def random
    (0..8).to_a.sample
  end

end