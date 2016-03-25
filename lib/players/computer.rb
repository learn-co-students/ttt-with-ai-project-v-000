class Computer < Player

  def move(board)
    ["5", "1", "9", "3", "7", "2", "4", "6", "8"].each {|num| return num if board.valid_move?(num)}
  end

end
