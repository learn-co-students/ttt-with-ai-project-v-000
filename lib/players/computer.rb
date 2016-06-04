class Computer < Player
  attr_accessor :moves
    
  @moves = []

  def move (board = nil)
    
    if board.cells[4] != "X" || board.cells[4] != "O"
      return "4"
    elsif  board.cells[0] != "X" || board.cells[0] !="O"
      return "0"
    elsif board.cells[2] != "X" || board.cells[2] != "O"
      return "2"
    elsif board.cells[6] != "X" || board.cells[6] != "O"      
      return "6"
    elsif board.cells[8] != "X" || board.cells[8] != "O"      
      return "8"
    elsif board.cells[1] != "X" || board.cells[1] != "O"      
      return "1"
    elsif board.cells[3] != "X" || board.cells[3] != "O"      
      return "3"
    elsif board.cells[5] != "X" || board.cells[5] != "O"      
      return "5"
    elsif board.cells[7] != "X" || board.cells[7] != "O"      
      return "7"
    end

  end
end #of Computer CLASS