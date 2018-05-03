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

            opencorners = [1,3,7,9].select{|i| board.cells[i-1] == " "}
            opensides = [2,4,6,8].select{|i| board.cells[i-1] == " "}

            #when occupying middle space, and opponent has opposite corners, choose random side position in 4th move
            #(will not execute if blocking of opponents win required)
            if (board.turn_count == 3 && board.cells[4] == "#{@token}")
                return move = opensides.sample.to_i
            end

            #if no special cases exist, prefer to take middle space, or randomly select one of the corners.  IF all taken, randomly select side.
            if board.cells[4] == " "
              return move = 5
            elsif opencorners.length != 0
              return move = opencorners.sample.to_i
            elsif opensides.length != 0
              return move = opensides.sample.to_i
            end

          end
      end
    end
