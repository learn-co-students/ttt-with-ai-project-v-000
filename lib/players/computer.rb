class Player::Computer < Player

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]


  def move(board)
    until over?
      position = board.cells.sample 
      if valid_move?(position)
      board.move(position, character="X")
      else
      move(board)
      end
    end
  end

  def taken?(position)
    position = (position.to_i)-1
    (cells[position] != " " && cells[position] != "" && cells[position] != nil)
  end

  def valid_move?(position)
    position = position.to_i - 1
    position.between?(0, 8) && !taken?(position)
  end


  def won?
    WIN_COMBINATIONS.each do |win_combination|
    position_1 = board.cells[win_combination[0]]
    position_2 = board.cells[win_combination[1]]
    position_3 = board.cells[win_combination[2]]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    return false
  end

  def draw?
    full? == true && won? == false
  end

  def over?
    won? != false || draw? == true
  end

end