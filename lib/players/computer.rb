module Players
  class Computer < Player
    def move(board)
    win_combo = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2],
    ]

    case self.token
    when "X"
    enemy_token = "O"
    when "O"
    enemy_token = "X"
    end

    kill_zone = win_combo.detect do |array|
      board.cells[array[0]] == enemy_token && board.cells[array[1]] == enemy_token && board.cells[array[2]] == " " ||
      board.cells[array[1]] == enemy_token && board.cells[array[2]] == enemy_token && board.cells[array[0]] == " " ||
      board.cells[array[0]] == enemy_token && board.cells[array[2]] == enemy_token && board.cells[array[1]] == " "
    end


    if board.cells[4] == " "
      "5"


    elsif kill_zone != nil
      target = kill_zone.detect do |position|
        if board.cells[position] == " "
          position
        end
      end

      answer = target + 1
      answer.to_s


      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      elsif board.cells[3] == " "
        "4"
      elsif board.cells[5] == " "
        "6"
      elsif board.cells[1] == " "
        "2"
      elsif board.cells[7] == " "
        "8"
      else board.cells[0] == " "
        "1"
      end
    end
  end
end
