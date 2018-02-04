module Players
  class Computer < Player
    def move(board)
      if board.cells[4] == " "
        "5"
      elsif board.cells[0] == " " || board.cells[2] == " " || board.cells[6] == " " || board.cells[8] == " "
        choices = ["1", "3", "7", "9"]
        choice = choices.sample
        if board.taken?(choice) == false
          choice
        else
          move(board)
        end
      else
      choices = ["2","4", "6", "8"]
      choice = choices.sample
      if board.taken?(choice) == false
        choice
      else
        move(board)
      end
    end
    end

  end
end
