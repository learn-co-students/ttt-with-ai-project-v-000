class Player::Computer < Player

  def move(board)
    !board.taken?("5") ? "5" : next_move(board) + 1
  end

  def next_move(board)
    win_or_block(board) || corner_move(board) || remaining_move(board)
  end

  # Takes one of the four corners of the TTT board
  def corner_move(board)
    random_corners = [0, 2, 6, 8].shuffle!
    random_corners.find {|cell| !board.taken?(cell+1)}
  end

  # Takes one of the reamining positions of the TTT board
  def remaining_move(board)
    random_remainders = [1, 3, 5, 7].shuffle!
    random_remainders.find {|cell| !board.taken?(cell+1)}
  end

  # Checks to see if a player is one move away from a win
  def reach?(board, token) 
    Game::WIN_COMBINATIONS.find do |win_combo| 
      (board.cells[win_combo[0]] == token && board.cells[win_combo[1]] == token) && !board.taken?(win_combo[2] + 1) ||
      (board.cells[win_combo[1]] == token && board.cells[win_combo[2]] == token) && !board.taken?(win_combo[0] + 1) ||
      (board.cells[win_combo[2]] == token && board.cells[win_combo[0]] == token) && !board.taken?(win_combo[1] + 1)
    end
  end

  # Returns the opponent's token
  def opponent_token 
    self.token == 'X' ? 'O' : 'X'
  end

  # Makes the winning move, or blocks the opponent's attempt to win
  def win_or_block(board) 
    if reach?(board, self.token)
      reach?(board, self.token).find {|cell| !board.taken?(cell+1)}
    elsif reach?(board, self.opponent_token)
      reach?(board, self.opponent_token).find {|cell| !board.taken?(cell+1)}
    end
  end
end