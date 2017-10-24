class Computer < Player

  def move(board)
    if !board.taken?("5")
      "5"
    elsif board.taken?("5") && complete_combo(board).nil?
      corner(board) || rand(9).to_s
    else
      complete_combo(board)
    end
  end

  def corner(board)
    [1, 3, 7, 9].detect {|c| !board.taken?(c)}
  end

  def incomplete_combo(board)
    b = board.cells
    Game::WIN_COMBINATIONS.detect do |c|
      (b[c[0]] != " " && b[c[0]] == b[c[1]] && b[c[2]] == " ") ||
      (b[c[1]] != " " && b[c[2]] == b[c[1]] && b[c[0]] == " ") ||
      (b[c[0]] != " " && b[c[2]] == b[c[0]] && b[c[1]] == " ")
    end
  end

  def complete_combo(board)
    if incomplete_combo(board)
      mv = incomplete_combo(board).detect {|space| board.cells[space] == " "}
      return (mv + 1).to_s
    else
      nil
    end
  end


end
