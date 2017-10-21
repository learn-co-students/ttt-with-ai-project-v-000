class Player::Computer < Player

  def move(board)
    if !board.taken?(5)
      "5"
    elsif prevent_winning_move(board)
      prevent_winning_move(board)
    else
      random_move
    end
  end

  def opponent
    self.token != "O" ? "O" : "X"
  end

  def random_move
    rand(1..9).to_s
  end

  def find_combo(board)
    brd = board.cells
    Game::WIN_COMBINATIONS.find do |pos|
      brd[pos[0]] == opponent && brd[pos[1]] == opponent && brd[pos[2]] == " " ||
      brd[pos[0]] == opponent && brd[pos[2]] == opponent && brd[pos[1]] == " " ||
      brd[pos[1]] == opponent && brd[pos[2]] == opponent && brd[pos[0]] == " "
    end
  end

  def prevent_winning_move(board)
    unless find_combo(board).nil?
      find_combo(board).find { |i| board.cells[i] == " " }.next
    end
  end

end
