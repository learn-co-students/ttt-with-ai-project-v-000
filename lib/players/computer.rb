class Player::Computer < Player
  attr_accessor

  def move(board)
    return "5" if !board.taken?("5")
    win_move(board)
  end

  def win_move(board)
    win(board) || block_move(board) || best_move(board)
  end 

  def opponent
    self.token == "O" ? "X" : "O"
  end 

  def stop_win(board, token)
    Game::WIN_COMBINATIONS.detect do |i|
      (board.cells[i[0]] == token && board.cells[i[1]] == token && !board.taken?(i[2]+1)) ||
      (board.cells[i[1]] == token && board.cells[i[2]] == token && !board.taken?(i[0]+1)) ||
      (board.cells[i[2]] == token && board.cells[i[0]] == token && !board.taken?(i[1]+1))
    end
  end
 
  def win(board)
    if !stop_win(board, self.token).nil?
      stop_win(board, self.token).find { |pos| board.cells[pos] == " " }.to_i+1
    end
  end 

  def block_move(board)
    if !stop_win(board, opponent).nil?
      stop_win(board, opponent).find {|pos| board.cells[pos] == " "}.to_i + 1
    end
  end 

  def best_move(board)
    ["1", "2", "3", "4", "6", "7", "8", "9"].detect {|i| !board.taken?(i)}
  end
end