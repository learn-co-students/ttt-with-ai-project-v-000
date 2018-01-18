class Player::Computer < Player

  def move(board)
    if !board.taken?("5")
      "5"
    else
      second_move(board)
    end
  end

  def second_move(board)
    winner(board) || corner(board) || edge(board)
  end

  def winner(board)
    Game::WIN_COMBINATIONS.detect do |combo|
      if (board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " " && board.cells[combo[0]] != " ")
        return (combo[2]+1).to_s
      elsif (board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " " && board.cells[combo[0]] != " ")
        return (combo[1]+1).to_s
      elsif (board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " " && board.cells[combo[1]] != " ")
        return (combo[0]+1).to_s
        end
      end
    end

  def corner(board)
    if !board.taken?("1")
      "1"
    elsif !board.taken?("3")
      "3"
    elsif !board.taken?("7")
      "7"
    elsif !board.taken?("9")
      "9"
    end
  end

  def edge(board)
    if !board.taken?("2")
      "2"
    elsif !board.taken?("4")
      "4"
    elsif !board.taken?("6")
      "6"
    elsif !board.taken?("8")
      "8"
    end
  end

end
