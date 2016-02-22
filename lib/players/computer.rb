class Computer < Player

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
    sleep 3
    @board = board
    center_square || strategy || random
  end

  def center_square
    if @board.taken?(5) == false
      return "5"
    else
      return false
    end
  end

  def strategy
    move = ""
    WIN_COMBINATIONS.each do |win_combo|
      if (@board.cells[win_combo[0]] == @board.cells[win_combo[1]]) && @board.cells[win_combo[0]] != " "  && @board.cells[win_combo[0]] != token && @board.cells[win_combo[2]] == " "
        move = (win_combo[2]+1).to_s
        return move
        break
      elsif (@board.cells[win_combo[0]] == @board.cells[win_combo[2]]) && @board.cells[win_combo[0]] != " "  && @board.cells[win_combo[0]] != token && @board.cells[win_combo[1]] == " "
        move = (win_combo[1]+1).to_s
        return move
        break
      elsif (@board.cells[win_combo[1]] == @board.cells[win_combo[2]]) && @board.cells[win_combo[1]] != " "  && @board.cells[win_combo[1]] != token && @board.cells[win_combo[0]] == " "
        move = (win_combo[0]+1).to_s
        return move
        break
      end
    end
    move  == "" ? false : move
  end

 def random
    position = [*(1..9)].sample.to_s
    if @board.valid_move?(position) == true
      position
      else
      random
    end
  end


end