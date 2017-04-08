CORNERS = [1, 3, 7, 9]
EDGES = [2, 4, 6, 8]
TRI = [[1,3,5], [3,5,9], [5,7,9], [1,5,7]]
def move(board)
  @move = nil
  one = 5
  if board.valid_move?(one)
    @move = one
  elsif almost_lose(board)
    block_move(board)
  elsif almost_win(board)
    win_move(board)
  else
    next_move(board)
    last_move(board)
  end
end

def next_move(board)
  CORNERS.select{|v| board.valid_move?(v)}.sample  
end

def block_move(board)
  @move = almost_lose(board).detect{|b| b == " "}
  @move
end

def win_move(board)
  @move = almost_win(board).detect{|b|b == " "}
  @move
end

def last_move(board)
  EDGES.select{|v| board.valid_move?(v)}
end

def almost_win(board)
  WIN_COMBINATIONS.detect {|w|w.select {|a| board.cells[a-1] == self.token}.length == 2}
end

def almost_lose(board)
  WIN_COMBINATIONS.detect {|w|w.select {|a| board.cells[a-1] == opposite_token}.length == 2}
end

def opposite_token
  self.token == "X" ? "O" : "X"
end