class ComputerBrain
  
  WINS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  
  CENTERS = [4]
  CORNERS = [0,2,6,8]
  SIDES = [1,3,5,7]  
  
  def move (board)
    
    if (m = find_winning_move(board))
      return m
    end
    
    if (m = find_blocking_move(board))
      return m
    end
    
    if (m = find_center_move(board))
      return m
    end
    
    if (m = find_corner_move(board))
      return m
    end
    
    if (m = find_side_move(board))
      return m
    end
    
  end
  
  #private
  
  def find_winning_move(board)
    combo = WINS.find { |e| near_win?(board, e, my_token(board)) }
    if combo.nil?
      return nil
    end
    to_pos(combo.find { |e| board.cells[e] == " " })
  end
  
  def find_blocking_move(board)
    combo = WINS.find { |e| near_win?(board, e, foe_token(board)) }
    if combo.nil?
      return nil
    end
    to_pos(combo.find { |e| board.cells[e] == " " })
  end
  
  def find_center_move(board)
    to_pos(CENTERS.find { |i| board.cells[i] == " " })
  end
  
  def find_corner_move(board)
    to_pos(CORNERS.find { |i| board.cells[i] == " " })
  end
  
  def find_side_move(board)
    to_pos(SIDES.find { |i| board.cells[i] == " " })
  end

  #utilities
  
  def near_win?(board, combo, token)
    combo.find_all { |i| board.cells[i] == token }.size == 2 &&
    combo.find_all { |i| board.cells[i] == " " }.size == 1
  end
  
  def to_pos(index)
    if index.nil?
      return nil
    else
      return (index + 1).to_s
    end
  end
  
  def foe_token(board)
    board.cells.find_all {|t| t == "X" || t == "O"}.size.even? ? "O" : "X"
  end
  
  def my_token(board)
    foe_token(board) == "X" ? "O" : "X"
  end
  
end