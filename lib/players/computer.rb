module Players
    class Computer < Player
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

    def move(board)
    if !board.taken?(5)
      move = "5"
    else
      best_move(board) + 1
    end
  end

  def best_move(board)
    win(board) || block(board) || corner(board) || random
  end

  def win(board)
    winning_combo = complete_combo?(board, self.token)
    if winning_combo && winning_combo.count{|index| board.position(index+1) == self.token} == 2
       winning_combo.detect{|index| !board.taken?(index+1)}
    end
  end

  def block(board)
    blocking_combo = complete_combo?(board, self.opponent_token)
    if blocking_combo && blocking_combo.count{|index| board.position(index+1) == self.opponent_token} == 2
       blocking_combo.detect{|index| !board.taken?(index+1)}
    end
  end

  def corner(board)
    [0,2,6,8].detect{|cell| !board.taken?(cell+1)}
  end

  def random
    (0..8).to_a.sample
  end

  def complete_combo?(board, token)
    Game::WIN_COMBINATIONS.detect do |combo|
      (
        (board.cells[combo[0]] == token && board.cells[combo[1]] == token) &&
        !board.taken?(combo[2]+1)
      ) ||
      (
        (board.cells[combo[1]] == token && board.cells[combo[2]] == token) &&
        !board.taken?(combo[0]+1)
      ) ||
      (
        (board.cells[combo[0]] == token && board.cells[combo[2]] == token) &&
        !board.taken?(combo[1]+1)
      )
    end
  end

  def opponent_token
    self.token == "X" ? "O" : "X"
  end
end
end
