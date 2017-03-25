def move(board) #Computer
  if board.cells[4] == " "
    "5"
  else
    if self.token == "X"
      move = ""
      Game::WIN_COMBINATIONS.each do |win_combo|
        if board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O" && !board.taken?("#{win_combo[2]}")
          move = "#{win_combo[2]}"
        elsif board.cells[win_combo[0]] == "O" && board.cells[win_combo[2]] == "O" && !board.taken?("#{win_combo[1]}")
          move = "#{win_combo[1]}"
        elsif board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O" && !board.taken?("#{win_combo[0]}")
          move = "#{win_combo[0]}"
        else
          move_cell = board.detect {|cell| cell == " "}
          move = "#{board.find_index(move_cell).to_i + 1}"
        end
      end
      move
    elsif self.token == "O"
      move = ""
      Game::WIN_COMBINATIONS.each do |win_combo|
        if board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O" && !board.taken?("#{win_combo[2]}")
          move = "#{win_combo[2]}"
        elsif board.cells[win_combo[0]] == "O" && board.cells[win_combo[2]] == "O" && !board.taken?("#{win_combo[1]}")
          move = "#{win_combo[1]}"
        elsif board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O" && !board.taken?("#{win_combo[0]}")
          move = "#{win_combo[0]}"
        else
          move_cell = board.cells.detect {|cell| cell == " "}
          move = "#{board.cells.find_index(move_cell) + 1}"
        end
        move
      end
    end
  end
end
