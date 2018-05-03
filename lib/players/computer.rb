  module Players
        class Computer < Player
          def move(board)
            move = nil

            #if two of three spaces in any winning combination are taken, moves to the third spot to block or win
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

            #when occupying middle space, and opponent has opposite corners, choose side position in 4th move
            #(will not execute if blocking of opponents win required)
            if (board.turn_count == 3 && board.cells[4] == "#{token}")
                sides = [2,4,6,8].select{|position| board.cells[position] == " "}
                return move = sides.shuffle.first
            end

            #if no special cases exist, prefer to take middle space, or one of the corners
            if move ==  nil
              return move = [5, 1, 3, 7, 9, 2, 4, 6, 8].detect{|i| board.cells[i-1] == " "}
            end

          end
      end
    end
