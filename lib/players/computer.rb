module Players
  
  class Computer < Player
    def move(board)
      if board.cells[4] != "X" && board.cells[4] != "O"
        5
      elsif board.cells[0] != "X" && board.cells[0] != "O"
        1 
      elsif board.cells[2] != "X" && board.cells[2] != "O"
        3
      elsif board.cells[0] == self.token && board.cells[2] == self.token
        2 
      else 
        array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        array.sample 
      end 
    end
  end 
  
end 