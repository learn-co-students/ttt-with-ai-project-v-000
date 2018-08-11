module Players

class Computer < Player

  def move(board)
    if board.cells[4].nil? || board.cells[4] == " "
      input = 5.to_s
    elsif board.cells[6].nil? || board.cells[6] == " "
      input = 7.to_s
    elsif board.cells[8].nil? || board.cells[8] == " "
      input = 9.to_s
    elsif board.cells[0].nil? || board.cells[0] == " "
      input = 1.to_s
    elsif board.cells[2].nil? || board.cells[2] == " "
      input = 3.to_s
    else
      input = rand(1..9).to_s
    end
  end

end

end
