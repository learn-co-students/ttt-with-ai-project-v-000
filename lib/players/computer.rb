class Players::Computer < Player
  attr_accessor :board

  def move(board)
    if board.turn_count == 0
      pos = "1,3,5,7,9".split(",").sample
    elsif board.turn_count == 1 && "1,2,3,4,6,7,8,9".split(",").any? { |e| board.taken?(e) }
      pos = "5"
    elsif board.turn_count == 1 && board.taken?(5)
      pos = "1,3,7,9".split(",").sample
    else
    winning_move(board)
    end
  end

  def winning_move(board)
    win(board) || block_move(board)  || best_move_3(board, opponent) || best_move_1(board) || best_move_2(board)
  end

  def opponent
    self.token == "O" ? "X" : "O"
  end

  def almost(board, token)
    Game::WIN_COMBINATIONS.detect do |index|
      (board.cells[index[0]] == token && board.cells[index[1]] == token && !board.taken?(index[2]+1)) ||
      (board.cells[index[1]] == token && board.cells[index[2]] == token && !board.taken?(index[0]+1)) ||
      (board.cells[index[2]] == token && board.cells[index[0]] == token && !board.taken?(index[1]+1))
    end
  end

  def win(board)
    if !almost(board, self.token).nil?
      almost(board, self.token).detect {|location| board.cells[location] == " " }.to_i+1
    end
  end

  def block_move(board)
    if !almost(board, opponent).nil?
      almost(board, opponent).detect {|location| board.cells[location] == " "}.to_i + 1
    end
  end

  def best_move_1(board)
    [1, 3, 7, 9].detect {|pos| !board.taken?(pos)}
  end

  def best_move_2(board)
    [2, 4, 6, 8].detect {|pos| !board.taken?(pos)}
  end

  def best_move_3(board, opponent)
    if  board.cells[0] == opponent && board.cells[8] == opponent && board.cells[4] == self.token
      [2, 4, 6, 8].detect {|pos| !board.taken?(pos)}
    elsif board.cells[2] == opponent && board.cells[6] == opponent && board.cells[4] == self.token
      [2, 4, 6, 8].detect {|pos| !board.taken?(pos)}
    end
  end


end

## modified from@zivolution921 code to include starting cases and make it so that it chooses to win over tie if the choose is given. 0 player games still result in tie always.
