class Computer < Player

  def move(board)
    if !board.taken?("5")
      "5"
    else
      best_move(board) + 1
    end
  end

  def make_combo(board, token)
    Game::WIN_COMBINATIONS.detect do |combo|
      (board.cells[combo[0]] == token && board.cells[combo[1]] == token && !board.taken?(combo[2]+1)) ||
      (board.cells[combo[1]] == token && board.cells[combo[2]] == token && !board.taken?(combo[0]+1)) ||
      (board.cells[combo[0]] == token && board.cells[combo[2]] == token && !board.taken?(combo[1]+1))
    end
  end

  def best_move(board)
    winning(board) || blocking(board) || corners(board) || sides(board)
  end

  def winning(board)
    to_win = make_combo(board, token)
    to_win.detect {|pos| !board.taken?(pos+1)} if to_win
  end

  def blocking(board)
    to_block = make_combo(board, opponent_token)
    to_block.detect {|pos| !board.taken?(pos+1)} if to_block
  end

  def corners(board)
    [0,2,6,8].detect {|pos| !board.taken?(pos+1)}
  end

  def sides(board)
    [1,3,5,7].detect {|pos| !board.taken?(pos+1)}
  end

  def opponent_token
    self.token == "X" ? "O" : "X"
  end

end