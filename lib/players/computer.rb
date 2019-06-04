module Players
  class Computer < Player
    def all_moves(board)
      #assumes first player token is "X" and second player token is "O"
      moves = [[],[]]
      board_positions = board.cells.map.with_index(1).to_a
      board_positions.map {|space|
        if space[0] == "X"
          moves[0] << space[1]
        elsif space[1] == "O"
          moves[1] << space[1]
        end
      }
      moves
    end

    def move(board)
      # this does not create a perfect game... to be refined in the future!
      if board.cells[4] == " " #always choose middle position if open
        "5"
      else
        current_player_valid_combos = []
        other_player_valid_combos = []
        current_player = (all_moves(board)[0].length == all_moves(board)[1].length ? "X" : "O")
        other_player = (all_moves(board)[0].length == all_moves(board)[1].length ? "O" : "X")
        current_check_values = [" ",current_player]
        other_check_values = [" ",other_player]
        other_player_closest = [0,"combo"] # [how many spots occupied towards a solution, closest combo to a solution]
        Game::WIN_COMBINATIONS.map {|combo|
          if current_check_values.include?(board.cells[combo[0]]) && current_check_values.include?(board.cells[combo[1]]) && current_check_values.include?(board.cells[combo[2]])
            current_player_valid_combos << combo
          elsif other_check_values.include?(board.cells[combo[0]]) && other_check_values.include?(board.cells[combo[1]]) && other_check_values.include?(board.cells[combo[2]])
            other_player_valid_combos << combo
            other_player_moves = 0
            combo.each {|position| other_player_moves += 1 if board.cells[position] == other_player }
            if other_player_moves > other_player_closest[0]
              other_player_closest[0] = other_player_moves
              other_player_closest[1] = combo
            end
          end
        }
        if other_player_closest[0] == 2
          other_player_closest[1].select{|i| board.cells[i] == " "}[0] + 1
        elsif other_player_closest[0] == 1
          index = other_player_closest[1].select{|i| board.cells[i] == other_player}[0]
          if index.even? && index != 4
            other_player_closest[1][1] + 1
          else
            [other_player_closest[1][0],other_player_closest[1][2]].sample + 1
          end
        end
      end
    end
  end
end
