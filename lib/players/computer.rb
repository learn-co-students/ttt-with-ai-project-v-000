class Players::Computer < Player

attr_accessor :player

  def initialized(token)
    Player.new=self
     @token
  end

  def move(board)
    if !board.taken?("5")
      "5"
    else
      next_move(board) + 1
    end
  end

  def next_move
    win(board) || corner(board)
  end

  def corner(board)
    binding.pry
    [0,2,6,8].detect do|cell|
      !cell.board.taken?(cell + 1)
    end
  end

  def winning_combo?(board, token)
      Game::WIN_COMBINATIONS.detect do |combo|
        ((board.cells[combo[0]] == token && board.cells[combo[1]] == token) && !board.taken?(combo[2]+1)) ||
        ((board.cells[combo[1]] == token && board.cells[combo[2]] == token) && !board.taken?(combo[0]+1)) ||
        ((board.cells[combo[0]] == token && board.cells[combo[2]] == token) && !board.taken?(combo[1]+1))
      end
   end

end
