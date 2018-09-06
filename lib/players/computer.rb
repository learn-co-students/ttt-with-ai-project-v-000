module Players
  class Computer < Player

    def move(board)
      #range = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      #meh = range.sample
      #if board.valid_move?(meh)
      #  move = meh
      #end
      minmax(board)
    end

    #minmax theory. We play a max whenever possible against a min
    #max would aim for center row if available. That gets a +100 score on a counter
    #min always tries to block max
    #what arguments does it take? the board again, or the player to maximize?
    # our goal is to get the best possible score. A Loss is -1000 a win +1000
    #pseudo: case 1) if position 5 is available take it, leading attack
    # then scan the board and place the next X in whichever row there are no Os
    # case 2) if position 5 is not available place in any adjacent cube to 5, so 2,4,5,8. leaing defense
    # then scan board and block O's move. use a counter to add value to each move. X is always first.
    #at the moment do middle, then middle spaces, then corner. No logic to evaluate the board state yet.

    def minmax(board)
      max =  1000
      min = -1000
      counter = []

      if board.valid_move?("5")
        attack = "5"
      else
        sampi_one = [2,4,8].sample
        if board.valid_move?(sampi_one)
          attack = sampi_one
        else
          sampi_two = [1,3,7,9].sample
          board.valid_move?(sampi_two)
          attack = sampi_two
        end
      end

    end

    def score
      scores = []
      if draw?
        scores.push(1)
      elsif winner == "X"
        scores.push(5)
      else winner == "O"
        scores.push(-5)
      end
    end

  end
end
