class Computer < Player

  def move(board_cells)
    possible_moves = board_cells.each_index.select {|i| board_cells[i] == " "}.collect {|n| (n+1).to_s }
    sleep 2
    possible_moves.sample
  end

end
