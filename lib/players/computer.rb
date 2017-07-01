require 'pry'

module Players
  class Computer < Player

    def move(board)
        case
        when board.cells[1] == board.cells[4] && board.cells[1] != " " && !board.taken?(7)
          move = "7"
        when board.cells[1] == board.cells[7] && board.cells[1] != " " && !board.taken?(4)
          move = "4"
        when board.cells[4] == board.cells[7] && board.cells[4] != " " && !board.taken?(1)
          move = "1"
        when board.cells[1] == board.cells[5] && board.cells[1] != " " && !board.taken?(9)
          move = "9"
        when board.cells[1] == board.cells[9] && board.cells[1] != " " && !board.taken?(5)
          move = "5"
        when board.cells[5] == board.cells[9] && board.cells[5] != " " && !board.taken?(1)
          move = "1"
        when board.cells[1] == board.cells[2] && board.cells[1] != " " && !board.taken?(3)
          move = "3"
        when board.cells[1] == board.cells[3] && board.cells[1] != " " && !board.taken?(2)
          move = "2"
        when board.cells[2] == board.cells[3] && board.cells[2] != " " && !board.taken?(1)
          move = "1"
        when board.cells[2] == board.cells[5] && board.cells[2] != " " && !board.taken?(8)
          move = "8"
        when board.cells[2] == board.cells[8] && board.cells[2] != " " && !board.taken?(5)
          move = "5"
        when board.cells[5] == board.cells[8] && board.cells[5] != " " && !board.taken?(2)
          move = "2"
        when board.cells[3] == board.cells[5] && board.cells[5] != " " && !board.taken?(7)
          move = "7"
        when board.cells[3] == board.cells[7] && board.cells[7] != " " && !board.taken?(5)
          move = "5"
        when board.cells[7] == board.cells[5] && board.cells[5] != " " && !board.taken?(3)
          move = "3"
        when board.cells[3] == board.cells[6] && board.cells[3] != " " && !board.taken?(9)
          move = "9"
        when board.cells[6] == board.cells[9] && board.cells[6] != " " && !board.taken?(3)
          move = "3"
        when board.cells[9] == board.cells[3] && board.cells[9] != " " && !board.taken?(6)
          move = "6"
        when board.cells[4] == board.cells[5] && board.cells[5] != " " && !board.taken?(6)
          move = "6"
        when board.cells[5] == board.cells[6] && board.cells[5] != " " && !board.taken?(4)
          move = "4"
        when board.cells[6] == board.cells[4] && board.cells[6] != " " && !board.taken?(5)
          move = "5"
        when board.cells[7] == board.cells[8] && board.cells[7] != " " && !board.taken?(9)
          move = "9"
        when board.cells[8] == board.cells[9] && board.cells[8] != " " && !board.taken?(7)
          move = "7"
        when board.cells[9] == board.cells[7] && board.cells[9] != " " && !board.taken?(8)
          move = "8"
        when !board.taken?(1)
          move = "1"
        when !board.taken?(5)
          move = "5"
        when !board.taken?(9)
          move = "9"
        when !board.taken?(3)
          move = "3"
        when !board.taken?(7)
          move = "7"
        when !board.taken?(2)
          move = "2"
        when !board.taken?(6)
          move = "6"
        when !board.taken?(4)
          move = "4"
        when !board.taken?(8)
          move = "8"
        end
      move
    end
  end

end
