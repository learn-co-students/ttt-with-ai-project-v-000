module Players
  class Computer < Player
  def move(board)
    n=1
  computer_valid_moves =[]
  while n <=9
    if board.valid_move?(n)
    computer_valid_moves << n.to_s
  end
    n=n+1
  end
  r=rand(computer_valid_moves.length)
  n=computer_valid_moves[r]
  ##board.update(n)
  ##board.display
  n
  end
end
end
