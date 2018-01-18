class Player::Computer < Player
  def last_move(move)
    last = move
    return last
  end



  def move(board)

    board_chk = board.turn_count

    if board_chk == 0
      "5"
      last_move("5")
    elsif board_chk == 1
      board_chkr
      last_move(board_chkr)
    end
  end

  def board_chkr
    if board.cells[4] == " "
      return "5"
    elsif board.cells[0] === " "
      return "1"
    elsif board.cells[2] === " "
      return "3"
    elsif board.cells[6] === " "
      return "7"
    elsif board.cells[8] === " "
      return "9"
    end
  end

=begin
    case board_chk
    when board_chk === 0
      if board.taken?(5) == false
        "5"
      end
    when board_chk === 1
      if board.cells[4] == " "
        return "5"
      elsif board.cells[0] === " "
        return "1"
      elsif board.cells[2] === " "
        return "3"
      elsif board.cells[6] === " "
        return "7"
      elsif board.cells[8] === " "
        return "9"
      end
    end
=end

end
