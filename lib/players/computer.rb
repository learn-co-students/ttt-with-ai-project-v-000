class Computer < Player
  attr_accessor :board

  def move(board)
    ( !board.taken?("5") ? "5" : possible_move(board) + 1)
  end

  def possible_move(board)
    win_or_block(board) || corner_move(board) || edge_move(board) 
  end

  def corner_move(board)
    corners = [0,2,6,8]
    corners.shuffle.detect { |spot| !board.taken?(spot+1) }
  end

  def edge_move(board)
    [1,3,5,7].shuffle.detect { |spot| !board.taken?(spot+1) }
  end  

  def open_spot(board, token)  #returns winning combination that must be blocked or won
    Game::WIN_COMBINATIONS.detect do |spot|
      ((board.cells[spot[0]] == token && board.cells[spot[1]] == token) && !board.taken?(spot[2]+1)) ||
      ((board.cells[spot[1]] == token && board.cells[spot[2]] == token) && !board.taken?(spot[0]+1)) ||
      ((board.cells[spot[2]] == token && board.cells[spot[0]] == token) && !board.taken?(spot[1]+1))
    end
  end

  def opp_token
    ( self.token == "X" ? "O" : "X")
  end

# if there is a winning combination with one spot not taken, the next move is to pick this spot - 
# whether it's to block the opponent or to try to take it for the win
  def win_or_block(board)
    if open_spot(board, self.token)
      open_spot(board, self.token).detect { |index| !board.taken?(index+1) }
    elsif open_spot(board, self.opp_token)
      open_spot(board, self.opp_token).detect { |index| !board.taken?(index+1) }
    end 
  end

end