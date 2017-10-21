class Player::Computer < Player

  def corners
    if @valid_moves.include?(0)
     "1"
    elsif @valid_moves.include?(2)
     "3"
    elsif @valid_moves.include?(6)
    "7"
    elsif @valid_moves.include?(8)
    "9"
    end
  end

  def edges
    if @valid_moves.include?(1)
     "2"
    elsif @valid_moves.include?(3)
     "4"
    elsif @valid_moves.include?(5)
     "6"
    elsif @valid_moves.include?(7)
     "8"
    end
  end


  def move(board)
    @valid_moves = board.cells.each_index.select { |index| board.cells[index] == " "}
    if @valid_moves.include?(4)
      "5"
    else
      defend(board) || corners || edges || rand(1..9).to_s
    end
  end

  # The two_of_three method is iterating through the win combinations to find the
  # combination in which two of the three index spaces were taken and if that
  # returns true, find the empty index space of that combination and move it there
  # (using the defend method).

  def two_of_three(board)
    Game::WIN_COMBINATIONS.find do |i|
      (board.cells[i[0]] == board.cells[i[1]] && !board.taken?(i[2]+1)) ||
      (board.cells[i[1]] == board.cells[i[2]] && !board.taken?(i[0]+1)) ||
      (board.cells[i[2]] == board.cells[i[0]] && !board.taken?(i[1]+1))
    end
  end

  def defend(board)
    if !two_of_three(board).nil?
       two_of_three(board).find { |index| board.cells[index] == " " }+ 1
    end
  end

end
