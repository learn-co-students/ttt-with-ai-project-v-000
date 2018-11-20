module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2], #top row
      [3,4,5], #middle row
      [6,7,8], #bottom row
      [0,3,6], #left column
      [1,4,7], #middle column
      [2,5,8], #right column
      [0,4,8], #diagonal 1
      [2,4,6], #diagonal 2
      ]

    def move(board)
      WIN_COMBINATIONS.detect do |combo|
        while board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
          move = "5"

          if board.cells[combo[0]] == board.cells[combo[1]] && board.taken?(combo[0] + 1)
            move = board.cells[combo[2]]
          elsif board.cells[combo[0]] == board.cells[combo[2]] && board.taken?(combo[0] + 1)
            move = board.cells[combo[1]]
          elsif board.cells[combo[1]] == board.cells[combo[2]] && board.taken?(combo[1] + 1)
            move = board.cells[combo[0]]
          else
            move = "1-9".sample
          end
        end
        move
      end
    end
  end
end
      #if turn_count = 1
        #"5"
      #else
        #{}"1-9".sample
      #end
