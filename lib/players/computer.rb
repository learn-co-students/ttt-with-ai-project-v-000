class Player::Computer < Player

 def move(board)
  first_move(board)
end


def first_move(board)
cells = board.cells
      if cells[4] == " "
        return "5"
      elsif cells[0] == " " && cells[2] == " " && cells[6] == " " && cells[8] == " "
        ['1','3','7','9'].sample
      elsif (cells[0] == "X" && cells[1] == "X" && cells[2] == " ") || (cells[0] == "O" && cells[1] == "O" && cells[2] == " ")
          return "3"
      elsif (cells[0] == "X" && cells[2] == "X" && cells[1] == " ") || (cells[0] == "O" && cells[2] == "O" && cells[1] == " ")
          return "2"
      elsif (cells[1] == "X" && cells[2] == "X" && cells[0] == " ") || (cells[1] == "O" && cells[2] == "O" && cells[0] == " ")
          return "1"
      elsif (cells[3] == "X" && cells[4] == "X" && cells[5] == " ") || (cells[3] == "O" && cells[4] == "O" && cells[5] == " ")
          return "6"
      elsif (cells[3] == "X" && cells[5] == "X" && cells[4] == " ") || (cells[3] == "O" && cells[5] == "O" && cells[4] == " ")
          return "5"
      elsif (cells[4] == "X" && cells[5] == "X" && cells[3] == " ") || (cells[4] == "O" && cells[5] == "O" && cells[3] == " ")
          return "4"
      elsif (cells[6] == "X" && cells[7] == "X" && cells[8] == " ") || (cells[6] == "O" && cells[7] == "O" && cells[8] == " ")
          return "9"
      elsif (cells[6] == "X" && cells[8] == "X" && cells[7] == " ") || (cells[6] == "O" && cells[8] == "O" && cells[7] == " ")
          return "8"
      elsif (cells[7] == "X" && cells[8] == "X" && cells[6] == " ") || (cells[7] == "O" && cells[8] == "O" && cells[6] == " ")
          return "7"
      elsif (cells[0] == "X" && cells[3] == "X" && cells[6] == " ") || (cells[0] == "O" && cells[3] == "O" && cells[6] == " ")
          return "7"
      elsif (cells[0] == "X" && cells[6] == "X" && cells[3] == " ") || (cells[0] == "O" && cells[6] == "O" && cells[3] == " ")
          return "4"
      elsif (cells[3] == "X" && cells[6] == "X" && cells[0] == " ") || (cells[3] == "O" && cells[6] == "O" && cells[0] == " ")
          return "1"
      elsif (cells[1] == "X" && cells[4] == "X" && cells[7] == " ") || (cells[1] == "O" && cells[4] == "O" && cells[7] == " ")
          return "8"
      elsif (cells[1] == "X" && cells[7] == "X" && cells[4] == " ") || (cells[1] == "O" && cells[7] == "O" && cells[4] == " ")
          return "5"
      elsif (cells[4] == "X" && cells[7] == "X" && cells[1] == " ") || (cells[4] == "O" && cells[7] == "O" && cells[1] == " ")
          return "2"
      elsif (cells[2] == "X" && cells[5] == "X" && cells[8] == " ") || (cells[2] == "O" && cells[5] == "O" && cells[8] == " ")
          return "9"
      elsif (cells[2] == "X" && cells[8] == "X" && cells[5] == " ") || (cells[2] == "O" && cells[8] == "O" && cells[5] == " ")
          return "6"
      elsif (cells[5] == "X" && cells[8] == "X" && cells[2] == " ") || (cells[5] == "O" && cells[8] == "O" && cells[2] == " ")
          return "3"
      elsif (cells[0] == "X" && cells[4] == "X" && cells[8] == " ") || (cells[0] == "O" && cells[4] == "O" && cells[8] == " ")
        return "9"
      elsif (cells[0] == "X" && cells[8] == "X" && cells[4] == " ") || (cells[0] == "O" && cells[8] == "O" && cells[4] == " ")
        return "5"
      elsif (cells[4] == "X" && cells[8] == "X" && cells[0] == " ") || (cells[4] == "O" && cells[8] == "O" && cells[0] == " ")
        return "1"
      elsif (cells[6] == "X" && cells[4] == "X" && cells[2] == " ") || (cells[6] == "O" && cells[4] == "O" && cells[2] == " ")
        return "3"
      elsif (cells[6] == "X" && cells[2] == "X" && cells[4] == " ") || (cells[6] == "O" && cells[2] == "O" && cells[4] == " ")
        return "5"
      elsif (cells[4] == "X" && cells[2] == "X" && cells[6] == " ") || (cells[4] == "O" && cells[2] == "O" && cells[6] == " ")
        return "7"
      else
        return rand(1..9).to_s
      end
  end
end

