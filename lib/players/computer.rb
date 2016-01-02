

class Player::Computer < Player
  attr_accessor 


  def move(board)
    return "5" if !board.taken?(5)
    best_option(board)
  end

  def best_option(board)
    win_move(board) || block_move(board) || strategic_move(board)
  end


  def opponent_token
    self.token == "X" ? "O" : "X"
  end


  def close_win(board, token)
    Game::WIN_COMBINATIONS.detect do |index|
    (board.cells[index[0]] == token && board.cells[index[1]] == token && !board.taken?(index[2]+1)) ||
    (board.cells[index[2]] == token && board.cells[index[1]] == token && !board.taken?(index[0]+1)) ||
    (board.cells[index[0]] == token && board.cells[index[2]] == token && !board.taken?(index[1]+1))
    end
  end 

  
  def win_move(board)
    if !close_win(board, self.token).nil?
      close_win(board, self.token).find { |pos| board.cells[pos] == " " }.to_i+1
    end 
  end

  def block_move(board)
    if !close_win(board, opponent_token).nil?
      close_win(board, opponent_token).find {|pos| board.cells[pos] == " "}.to_i + 1
    end
  end 


  def strategic_move(board)
    [1,3,7,9,4,6,8,2].detect{|number| !board.taken?(number)}
  end

end 





