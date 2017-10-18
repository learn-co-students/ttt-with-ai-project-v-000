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
# Unlike the Learn.co (textbook) AI, this AI focuses on preventing the opponent
# from winning, rather than trying to win itself.

# First the computer will check & see if the opponent has two
# spaces in any WIN_COMBINATIONS and occupy the 3rd empty space to prevent a win.
    kill_zone = win_combo.detect do |array|
      board.cells[array[0]] == enemy_token && board.cells[array[1]] == enemy_token && board.cells[array[2]] == " " ||
      board.cells[array[1]] == enemy_token && board.cells[array[2]] == enemy_token && board.cells[array[0]] == " " ||
      board.cells[array[0]] == enemy_token && board.cells[array[2]] == enemy_token && board.cells[array[1]] == " "
    end

      if kill_zone != nil
        target = kill_zone.detect do |position|
          if board.cells[position] == " "
            position
          end
        end

      answer = target + 1
      answer.to_s

# If the opponent does not occupy any two spaces in a WIN_COMBINATIONS array
# the AI will next try & occupy the middle (5) space on the board.
      elsif board.cells[4] == " "
      "5"

# If the middle (5) space is occupied and the opponent does not occupy 2 spaces
# in a WIN_COMBINATIONS, the AI will then go to a random corner space
      elsif y = board.cells.values_at(0, 2, 6, 8).sample
        if y == " "
           z = board.cells.index(y) + 1
           z.to_s
        end

# Finally, the AI will go to a random middle space (2, 4, 6, or 8) if no other options exist.
      else v = board.cells.values_at(1, 3, 5, 7).sample
        if v == " "
           w = board.cells.index(v) + 1
           w.to_s
        end


#  This older way was too predictable and the game was booring.

  #    elsif board.cells[4] == " "
  #      "5"
  #    elsif board.cells[0] == " "
  #      "1"
  #    elsif board.cells[2] == " "
  #      "3"
  #    elsif board.cells[6] == " "
  #      "7"
  #    elsif board.cells[8] == " "
  #      "9"
  #    elsif board.cells[3] == " "
  #      "4"
  #    elsif board.cells[5] == " "
  #      "6"
  #    elsif board.cells[1] == " "
  #      "2"
  #    else board.cells[7] == " "
  #      "8"
      end
    end
  end
end
