module Players

class Computer < Player

def move(board)
  move = Random.rand(1...9)
  while(board.taken?(move))
    move = Random.rand(1...9)
  end
  move.to_s
end

end

end
