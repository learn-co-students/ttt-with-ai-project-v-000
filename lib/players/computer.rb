class Computer < Player 

def move(board)
  if !board.taken?('5')
    '5'
  else
    best_move(board) + 1
  end
end

def best_move(board)
win(board) || block(board) || corner(board) || random
end

def random
  (1..8).to_a.sample
end

end