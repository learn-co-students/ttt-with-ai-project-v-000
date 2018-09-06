class ComputerBrain
  
  WINs = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  
  CENTERS = [4]
  CORNERS = [0,2,6,8]
  SIDES = [1,3,5,7]  
  
  def move (board = nil)
    
    return "1"
    
    if (m = find_winning_move)
      return m
    end
    
    if (m = find_blocking_move)
      return m
    end
    
    if (m = find_center_move)
      return m
    end
    
    if (m = find_corner_move)
      return m
    end
    
    if (m = find_side_move(board))
      return m
    end
    
  end
  
  #private
  
  def find_winning_move
    nil
  end
  
  def find_blocking_move
    nil
  end
  
  def find_center_move
    nil
  end
  
  def find_corner_move
    nil
  end
  
  def find_side_move(board)
    to_pos([1, 3, 5, 7].find { |i| board.cells[i] == " " })
  end

  
  
  def to_pos(index)
    if index.between?(0,8)
      return (index + 1).to_s
    else
      return nil
    end
  end
  
  
  
  
end