require 'pry'

module Players

  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [0,4,8],
      [2,5,8],
      [2,4,6]
    ]

    def move(board)
      until board.valid_move?(r=rand(1..9))
      end
      if board.turn_count < 3
        sleep(1)
        r.to_s #to fulfill test requirements
      elsif board.turn_count >= 3
        move_cell = r-1
        i,j,k = 0,1,2
        WIN_COMBINATIONS.each do |wc|
          3.times do
            if ((board.cells[wc[i]] == "X" && board.cells[wc[j]] == "X") || (board.cells[wc[i]] == "O" && board.cells[wc[j]] == "O")) && board.taken?(wc[k]+1) == false
              move_cell = wc[k]
            end
            i,j,k = j,k,i
          end
        end
        sleep(1)
        (move_cell+1).to_s #to fulfill test requirements
      end
    end

  end

end






# one step further - always choose to move to a place where win possibility is greater?
