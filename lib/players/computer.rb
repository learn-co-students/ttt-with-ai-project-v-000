module Players

  class Computer < Player

    def move(board)

      move = nil

      # ** if first or second move center or corner ** #
      if board.turn_count == 0 || board.turn_count == 1

        if board.cells[4] == " "
          move = "5"
        else ## ** BROKEN HERE ** ##
          [0, 2, 6, 8].detect do |val|
            if board.taken?[val] == false
            move = "#{val}"
            end
          end
        end

      # # ** else run through win_combos ** #
      else Game::WIN_COMBINATIONS.detect do |combo|

          if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " "
            move = "#{combo[2]}"

          elsif board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " "
            move = "#{combo[1]}"

          elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " "
            move = "#{combo[0]}"
          end
        end

       end

      # # if neither above, sample from array below
      # if move == nil
      #   board.cells.each_with_index do |val, index|
      #     if val == " "
      #       move == index.to_s
      #     end
      #   end
      # end

      move

    end

  end

end


#######

# Last Error
#
# Your turn, X.
# ---
# Please enter your move, 1-9
#
# 5
#    |   |
# -----------
#    | X |
# -----------
#    |   |
#
# ---
# Your turn, O.
# ---
# /Users/lauratrager/Development/code/ttt-with-ai-project-v-000/lib/board.rb:39:in `taken?': wrong number of arguments (given 0, expected 1) (ArgumentError)
# 	from /Users/lauratrager/Development/code/ttt-with-ai-project-v-000/lib/players/computer.rb:16:in `block in move'
# 	from /Users/lauratrager/Development/code/ttt-with-ai-project-v-000/lib/players/computer.rb:15:in `each'
# 	from /Users/lauratrager/Development/code/ttt-with-ai-project-v-000/lib/players/computer.rb:15:in `detect'
# 	from /Users/lauratrager/Development/code/ttt-with-ai-project-v-000/lib/players/computer.rb:15:in `move'
# 	from /Users/lauratrager/Development/code/ttt-with-ai-project-v-000/lib/game.rb:68:in `turn'
# 	from /Users/lauratrager/Development/code/ttt-with-ai-project-v-000/lib/game.rb:91:in `play'
# 	from /Users/lauratrager/Development/code/ttt-with-ai-project-v-000/lib/game.rb:130:in `start'
	# from ./bin/tictactoe:7:in `<main>'
