module Players

  class Computer < Player
    WIN_COMBINATIONS = [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
    def move(board)
      # binding.pry
      if block(board) == true
        input = block(board)
      elsif two_in_a_row(board) == true
        input = two_in_a_row(board)
      else
        input = rand(1...10)
      end
      # input = block(board) || two_in_a_row(board)
      # binding.pry
      sleep 1
      input.to_s
    end
    def two_in_a_row(board)
      WIN_COMBINATIONS.each do |win_combo|
        return win_combo[0] if board.cells[win_combo[0]] == " " && board.cells[win_combo[1]] == self.token && board.cells[win_combo[2]] == self.token
        return win_combo[1] if board.cells[win_combo[1]] == " " && board.cells[win_combo[0]] == self.token && board.cells[win_combo[2]] == self.token
        return win_combo[2] if board.cells[win_combo[2]] == " " && board.cells[win_combo[1]] == self.token && board.cells[win_combo[0]] == self.token
      end
    end
    def block(board)
      WIN_COMBINATIONS.each do |win_combo|
        return win_combo[0] if board.cells[win_combo[0]] == " " && board.cells[win_combo[1]] != self.token && board.cells[win_combo[2]] != self.token
        return win_combo[1] if board.cells[win_combo[1]] == " " && board.cells[win_combo[0]] != self.token && board.cells[win_combo[2]] != self.token
        return win_combo[2] if board.cells[win_combo[2]] == " " && board.cells[win_combo[1]] != self.token && board.cells[win_combo[0]] != self.token
      end
    end
  end

end