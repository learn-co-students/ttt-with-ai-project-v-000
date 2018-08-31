module Players
  class Computer < Player
  
  def move(board)
    if board.cells[4] == " "
      "1"
    else 
      "8"
    end
  end
  
  end
end