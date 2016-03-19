class Computer < Player
  def move(board)
    valid = []
    board.cells.each_with_index { |cell, index| valid << ((index+1).to_s) if cell == " "}
    valid.sample
  end

end