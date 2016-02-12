class Player::Computer < Player

  def move(board)
    if !board.taken?(5)
      first_move
    else
      win(board) || block(board) || make_a_move(board)
    end
  end

  def first_move
    "5"
  end

  def win(board)
    if !comb(board, self.token).nil?
      comb(board, self.token).find { |location| board.cells[location] == " "}.to_i+1
    end
  end

  def block(board)
      if !comb(board, token_player).nil?
      comb(board, token_player).find {|pos| board.cells[pos] == " "}.to_i + 1
    end
  end

  def make_a_move(board)
    [1,2,3,4,5,6,7,8,9].detect{|number| !board.taken?(number)}
  end

  def comb(board, token_player)
     Game::WIN_COMBINATIONS.detect do |index|
       (board.cells[index[0]] == token && board.cells[index[1]] == token && !board.taken?(index[2]+1)) ||
       (board.cells[index[2]] == token && board.cells[index[1]] == token && !board.taken?(index[0]+1)) ||
       (board.cells[index[0]] == token && board.cells[index[2]] == token && !board.taken?(index[1]+1))
     end
  end

  def token_player
    self.token == "X" ? "O" : "X"
  end

end