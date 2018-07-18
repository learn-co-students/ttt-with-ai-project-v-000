class Board
  attr_accessor :cells
  
  def reset!
    cells.clear
    cells = [" "," "," "," "," "," "," "," "," "]
  end
end