class Player::Computer < Player

  WIN_COMBINATIONS =
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]

  def move(board)
    @board = board
    take_center_5 || strategy || random
  end

  def take_center_5
    !@board.taken?(5) ? "5" : false 
  end

  def strategy
    make_move = ""
    WIN_COMBINATIONS.each do |win_combo|
      if (@board.cells[win_combo[0]] == @board.cells[win_combo[1]]) && @board.cells[win_combo[0]] != " "  && @board.cells[win_combo[0]] != token && @board.cells[win_combo[2]] == " "
        make_move = (win_combo[2]+1).to_s
        return make_move
        break
      elsif (@board.cells[win_combo[0]] == @board.cells[win_combo[2]]) && @board.cells[win_combo[0]] != " "  && @board.cells[win_combo[0]] != token && @board.cells[win_combo[1]] == " "
        make_move = (win_combo[1]+1).to_s
        return make_move
        break
      elsif (@board.cells[win_combo[1]] == @board.cells[win_combo[2]]) && @board.cells[win_combo[1]] != " "  && @board.cells[win_combo[1]] != token && @board.cells[win_combo[0]] == " "
        make_move = (win_combo[0]+1).to_s
        return make_move
        break
      end
    end
    make_move  == "" ? false : make_move
  end

  def random
    make_move = [*(1..9)].sample.to_s
    make_move
  end
end