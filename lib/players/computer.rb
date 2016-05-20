class Player::Computer < Player
  
  def move(board)
    # binding.pry
    best_move = nil
    board.available_moves.each do |move|
      return move if would_win?(board, move)
      return move if would_lose?(board, move)
    end
    if board.available_moves.include?("5")
      return "5"
    end
    if board.available_moves.include?("1")
      return "1"
    end
    if board.available_moves.include?("3")
      return "3"
    end 
    if board.available_moves.include?("7")
      return "7"
    end
    best_move ||= board.available_moves.sample
  end
  
  def opponent_token
    if token == "O"
      return "X"
    end 
    if token == "X"
      return "O"
    end
  end
  
  def board_after_next_move(board, move, token)
    board.project_move(move, token)
  end
  
  def would_win?(board, move)
    next_board = board_after_next_move(board, move, self.token)
    if won?(next_board) && winner(next_board) == self.token
      true 
    else
      false
    end
  end
  
  def would_lose?(board, move)
    next_board = board_after_next_move(board, move, self.opponent_token)
    if won?(next_board) && winner(next_board) == self.opponent_token
      true 
    else 
      false 
    end
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]  
  
  def won?(board) 
    WIN_COMBINATIONS.detect do |win_combo|
      board[win_combo[0]] == board[win_combo[1]] &&
      board[win_combo[1]] == board[win_combo[2]] &&
      board[win_combo[0]] != " "
    end
  end
  
  def winner(board)
    winning_combo = won?(board)
    if winning_combo 
      winner = board[winning_combo[0]]
    end
  end
end