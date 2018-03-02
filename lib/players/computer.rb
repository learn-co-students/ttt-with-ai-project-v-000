
module Players
  class Computer < Player
def move(board)
  #center position
  if !board.taken?("5")
    "5"
  else
    computer_move(board)
  end
end

def computer_move(board)
  win_move(board) || block(board) || corner(board) || middle_side(board)
end

def middle_side(board)
  [2, 4, 6, 8].detect {|pos| !board.taken?(pos)}
end

def corner(board)
  [1, 3, 7, 9].detect {|pos| !board.taken?(pos)}
end

def block_test(board)
  Game::WIN_COMBINATIONS.detect do |test|
    cells = [
      board.cells[test[0]], #because the nested array is only 3 items :-) I always forget
      board.cells[test[1]],
      board.cells[test[2]]
    ]
    cells.count == 2 && cells.include?(" ") && cells.count(opponent_token) == 2
  end
end

def block(board)
  block_test(board).detect {|pos| board.cells[pos] == " "} + 1 if !block_test(board).nil?
end

def win_test(board)
  Game::WIN_COMBINATIONS.detect do |test|
    cells = [
      board.cells[test[0]],
      board.cells[test[1]],
      board.cells[test[2]]
    ]
    cells.count == 2 && cells.include?(" ") && cells.count(self.token) == 2
  end
end

def win_move(board)
  win_test(board).detect {|pos| board.cells[pos] == " "} + 1 if !win_test(board).nil?
end

def opponent_token
  #if the opponent token is X then type O and vise versa
  self.token == "X" ? "O" : "X"
end

end
end
