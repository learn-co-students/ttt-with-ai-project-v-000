require 'pry'
class Computer < Player

  def move(board = nil)
    if x = win_or_block(board) || center(board) || corner_move(board) || side_move(board)
      ( x + 1 ).to_s
    end
  end

  def center(board)
    4 if !board.taken?(5)
  end

  def corner_move(board)
    [0,2,6,8].shuffle.detect { |corner| !board.taken?(corner + 1) }
  end

  def side_move(board)
    [1,3,5,7].shuffle.detect { |side| !board.taken?(side + 1) }
  end

  def opp_token
    token == "X" ? "O" : "X"
  end

  def end_move(board, token)
    Game::WIN_COMBINATIONS.detect do |win|
      win.map { |move| board.cells[move] }.grep(/\s/).size == 1 &&
      ((board.cells[win[0]] == token && board.cells[win[1]] == token) ||
      (board.cells[win[1]] == token && board.cells[win[2]] == token) ||
      (board.cells[win[2]] == token && board.cells[win[0]] == token))
    end
  end

  def win_or_block(board)
    if end_move(board, token)
      (end_move(board, token).detect { |move| board.cells[move] != token } )
    elsif end_move(board, opp_token)
      (end_move(board, opp_token).detect { |move| board.cells[move] != opp_token } )
    end
  end
end



