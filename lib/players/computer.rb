class Computer < Player

  def move(board)
    moves = board.cells.each_index.select {|i| board.cells[i] != "X" && board.cells[i] != "O"}
    self.token == "X" ? opposite_token = "O" : opposite_token = "X"
    moves.each do |x|
      board.cells[x] = self.token
      if Game.new(Computer.new("X"), Computer.new("O"), board).won?
        board.cells[x] = " "
        return (x + 1).to_s
      else
        board.cells[x] = " "
      end
    end
    moves.each do |x|
      board.cells[x] = opposite_token
      if Game.new(Computer.new("X"), Computer.new("O"), board).won?
        board.cells[x] = " "
        return (x + 1).to_s
      else
        board.cells[x] = " "
      end
    end
    return "5" if board.valid_move?("5")
    if board.cells[4] == self.token
      ["2", "8", "4", "6", "1", "3", "7", "9"].each { |n| return n if board.valid_move?(n) }
    else
    [ "1", "3", "7", "9", "2", "4", "6", "8"].each { |n| return n if board.valid_move?(n) }
    end
  end

end
