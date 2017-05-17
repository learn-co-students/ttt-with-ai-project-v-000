module Players
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
      corners = [1, 3, 7, 9]
      if board.turn_count == 0
        "#{corners.sample}"
      elsif board.valid_move?(5)
        "5"
      elsif board.turn_count <= 2 && board.valid_move?(corners.sample)
       "#{corners.sample}"
      else
        WIN_COMBINATIONS.each do |win_combination|
        case
        when board.cells(win_combination[0]) == board.cells(win_combination[1]) && board.cells(win_combination[0]) != self.token && board.cells[win_combination[0]] != " "
              "#{win_combination[2] + 1}"
          when board.cells[win_combination[0]] == board.cells[win_combination[2]] && board.cells[win_combination[0]] != self.token && board.cells[win_combination[0]] != " "
              "#{win_combination[1] + 1}"
          when board.cells[win_combination[1]] == board.cells[win_combination[2]] && board.cells[win_combination[2]] != self.token && board.cells[win_combination[2]] != " "
              "#{win_combination[0] + 1}"
          else
            "#{rand(1..9)}"
          end
        end
      end

    end
  end
end
