
class Players::Computer < Player

  def move(board)
    if self.token == "X"
      other_token = "O"
    else
      other_token = "X"
    end
    case board.turn_count
    when 1
      board.taken?(5) ? cell = 1 : cell = 5
    when 3
      cell = self.pair(board)
      if cell == nil
        cell = 1 if (board.cells[2] == other_token || board.cells[3] == other_token || board.cells[6] == other_token || board.cells[1] == other_token)
        cell = 3 if (board.cells[0] == other_token || board.cells[5] == other_token || board.cells[8] == other_token || board.cells[4] == other_token)
      end
    when 0 
      cell = 1
    end
    cell
  end
  
  def is_pair(pair, board)
    pair.each{|mark| mark = board.cells[board.position(mark)]}
    (pair.count("X") || pair.count("O") == 2) ? true : false
  end
  
  def is_token(pair, board)
    pair.each{|mark| mark = board.cells[board.position(mark)]}
    (pair.count(self.token) == 2) ? true : false
  end
  
  def pair(board)
    
    cell = nil
    h_right = [[1, 2], [4, 5], [7, 8]]
    h_left = [[3, 2], [6, 5], [9, 8]]
    h_gap = [[1, 3], [4, 6], [7, 9]]
    v_down = [[1, 4], [2, 5], [3, 6]]
    v_up = [[7, 4], [8, 5], [9, 6]]
    v_gap = [[1, 7], [2, 8], [3, 9]]
    angle = [[1, 5], [3, 5], [7, 5], [9, 5]]
    
   h_right.each do |pair|
      if (self.is_pair(pair, board) && !(board.taken(pair[1] + 1)))
        (cell = pair[1] + 1)
        return cell if self.is_token(pair, board)
      end
    end
    h_left.each do |pair|   
      if (self.is_pair(pair, board) && !(board.taken(pair[1] - 1)))
        (cell = pair[1] - 1)
        return cell if self.is_token(pair, board)
      end
    end
    h_gap.each do |pair| 
      if (self.is_pair(pair, board) && !(board.taken(pair[1] - 1)))
        (cell = pair[1] - 1)
        return cell if self.is_token(pair, board)
      end
    end
    v_down.each do |pair|  
      if (self.is_pair(pair, board) && !(board.taken(pair[1] + 3)))
        (cell = pair[1] + 3)
        return cell if self.is_token(pair, board)
      end
    end
    v_up.each do |pair|   
      if (self.is_pair(pair, board) && !(board.taken(pair[1] - 3)))
        (cell = pair[1] - 3) 
        return cell if self.is_token(pair, board)
      end
    end
    v_gap.each do |pair|  
      if (self.is_pair(pair, board) && !(board.taken(pair[1] - 3)))
        (cell = pair[1] - 3) 
        return cell if self.is_token(pair, board)
      end
    end
    angle.each do |pair|
      if (self.is_pair(pair, board) && !(board.taken(10 - pair[0])))
        (cell = 10 - pair[0])  
        return cell if self.is_token(pair, board)
      end
    end
    cell
  end
end