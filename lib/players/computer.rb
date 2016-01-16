class Computer < Player
  def move(board)
    board.taken?(5) ? winning_move(board) : opening_move
  end

  def opening_move
    "5"
  end

  def random_move(board)
    (1..9).to_a.sample
  end

  def opponent
    self.token == "X" ? "O" : "X"
  end

  def best_move(board)
    (1..9).to_a.find { |move| !board.taken?(move) }
  end

  def block_move(board)
    if !never_win(board, opponent).nil?
      never_win(board, opponent).find {|location| board.cells[location] == " " } .to_i+1
    end
  end

  def win(board)
    if !never_win(board, self.token).nil?
      never_win(board, self.token).find { |location| board.cells[location] ==  " " }.to_i+1
    end
  end

  def winning_move(board)
    block_move(board) || win(board) || best_move(board)
  end

  def never_win(board, token)
    Game::WIN_COMBINATIONS.detect do |index|
      (board.cells[index[0]] == token && board.cells[index[1]] == token && !board.taken?(index[2]+1)) ||
      (board.cells[index[1]] == token && board.cells[index[2]] == token && !board.taken?(index[0]+1)) ||
      (board.cells[index[2]] == token && board.cells[index[0]] == token && !board.taken?(index[1]+1))
    end
  end
end