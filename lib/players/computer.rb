class Computer < Player

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def move(board)
    moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]


    move = moves.sample

    corners = ["1", "3", "7", "9"]
    corners.each do |corner|
      if board.valid_move?(corner)
        move = corner
      end
    end

    WIN_COMBINATIONS.each do |combo|
      combo_cells = [board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]]

      if combo_cells.include?(self.token) && combo_cells.include?(" ") && !combo_cells.include?(self.opponent_token)
        combo.each { |cell| move = cell + 1 if board.cells[cell] == " "  }
      end
    end

    if board.valid_move?(move)
      return move
    else
      self.move(board)
    end
  end

  def opponent_token
    if self.token == "X"
      return "O"
    else
      return "X"
    end
  end
end
