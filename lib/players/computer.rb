  module Players
        class Computer < Player
          def move(board)
            move = nil

            Game::WIN_COMBINATIONS.each do |combo|

              checkArray = [board.cells[combo[0]].to_s, board.cells[combo[1]].to_s, board.cells[combo[2]].to_s]

              if checkArray.count("X").to_i == 2 && checkArray.count(" ").to_i > 0
                target = checkArray.index(" ")
                return move = (combo[target].to_i + 1)
              elsif checkArray.count("O").to_i == 2 && checkArray.count(" ").to_i > 0
                target = checkArray.index(" ")
                return move = (combo[target].to_i + 1)
              end
            end

            if move ==  nil
              return move = [5, 1, 3, 7, 9, 2, 4, 6, 8].detect{|i| board.cells[i-1] == " "}
            end

          end
      end
    end
