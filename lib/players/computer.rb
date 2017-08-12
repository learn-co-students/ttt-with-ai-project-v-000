module Players
  class Computer < Player
    def move(board)
      self.token == "X" ? opponent = "O" : opponent = "X"
      #There is obviously a better way to do this...but this works, finally.
      if board.cells[0] == opponent && board.cells[1] == opponent && board.cells[2] != self.token
        return "3"
      elsif board.cells[1] == opponent && board.cells[2] == opponent && board.cells[0] != self.token
        return "1"
      elsif board.cells[3] == opponent && board.cells[4] == opponent && board.cells[5] != self.token
        return "6"
      elsif board.cells[4] == opponent && board.cells[5] == opponent && board.cells[3] != self.token
        return "4"
      elsif board.cells[6] == opponent && board.cells[7] == opponent && board.cells[8] != self.token
        return "9"
      elsif board.cells[7] == opponent && board.cells[8] == opponent && board.cells[6] != self.token
        return "7"
      elsif board.cells[0] == opponent && board.cells[3] == opponent && board.cells[6] != self.token
        return "7"
      elsif board.cells[3] == opponent && board.cells[6] == opponent && board.cells[0] != self.token
        return "1"
      elsif board.cells[1] == opponent && board.cells[4] == opponent && board.cells[7] != self.token
        return "8"
      elsif board.cells[4] == opponent && board.cells[7] == opponent && board.cells[1] != self.token
        return "2"
      elsif board.cells[2] == opponent && board.cells[5] == opponent && board.cells[8] != self.token
        return "9"
      elsif board.cells[5] == opponent && board.cells[8] == opponent && board.cells[2] != self.token
        return "3"
      elsif board.cells[0] == opponent && board.cells[4] == opponent && board.cells[8] != self.token
        return "9"
      elsif board.cells[4] == opponent && board.cells[8] == opponent && board.cells[0] != self.token
        return "1"
      elsif board.cells[4] == opponent && board.cells[6] == opponent && board.cells[2] != self.token
        return "3"
      elsif board.cells[2] == opponent && board.cells[4] == opponent && board.cells[6] != self.token
        return "7"
      elsif board.cells[0] == opponent && board.cells[2] == opponent && board.cells[1] != self.token
        return "2"
      elsif board.cells[3] == opponent && board.cells[5] == opponent && board.cells[4] != self.token
        return "5"
      elsif board.cells[6] == opponent && board.cells[8] == opponent && board.cells[7] != self.token
        return "8"
      elsif board.cells[0] == opponent && board.cells[6] == opponent && board.cells[3] != self.token
        return "4"
      elsif board.cells[1] == opponent && board.cells[7] == opponent && board.cells[4] != self.token
        return "5"
      elsif board.cells[2] == opponent && board.cells[8] == opponent && board.cells[5] != self.token
        return "6"
      elsif board.cells[0] == opponent && board.cells[8] == opponent && board.cells[4] != self.token
        return "5"
      elsif board.cells[6] == opponent && board.cells[2] == opponent && board.cells[4] != self.token
        return "5"
      else
        choose_free_spot(board)
      end
    end

    #computer analyzes board and makes selection based only on available spots
    def choose_free_spot(board)
      free_spots = []
      board.cells.each_with_index do |cell, i|
        if cell === " "
          free_spots.push(i + 1)
        end
      end
      chosen_spot = free_spots.sample.to_s
      return chosen_spot
    end

  end
end
