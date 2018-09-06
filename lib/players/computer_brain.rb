class ComputerBrain
  
  WINs = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  
  CENTERS = [4]
  CORNERS = [0,2,6,8]
  SIDES = [1,3,5,7]  
  
  def move (board)
    
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
    
    if (m = find_side_move)
      return m
    end
    
  end
  
end