# move method
def move (position, token = "X")
  index = position.to_i - 1
  @board[index] = token
end
