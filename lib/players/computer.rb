class Player::Computer < Player
  attr_accessor 

  def opponent_token 
    self.token == "X" ? "O" : "X"
  end

  def move(board)
    return "5" if !board.taken?(5)
    best_option(board)
  end

  def best_option(board)
    one_move_win(board) || block_move(board) || strategic_move(board)
  end

  def one_away(board, token)
    Game::WIN_COMBINATIONS.detect do |combo|
      (board.cells[combo[0]] == token && board.cells[combo[1]] == token && !board.taken?(combo[2]+1)) || 
      (board.cells[combo[0]] == token && board.cells[combo[2]] == token && !board.taken?(combo[1]+1)) || 
      (board.cells[combo[1]] == token && board.cells[combo[2]] == token && !board.taken?(combo[0]+1))
    end
  end

  def one_move_win(board)
    if !one_away(board, self.token).nil?
      one_away(board, self.token).flatten.find{ |pos| board.cells[pos] == " " }.to_i+1
    end
  end

  def block_move(board)
    if !one_away(board, opponent_token).nil?
      one_away(board, opponent_token).flatten.find{ |pos| board.cells[pos] == " " }.to_i+1
    end
  end

  def strategic_move(board)
    [1,3,7,9,2,4,6,8].detect{ |pos| board.valid_move?(pos) }
  end
end
