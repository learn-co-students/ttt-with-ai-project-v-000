module Players

class Computer < Player

def move(board)
  board.valid_move?(board)
end

end

end
