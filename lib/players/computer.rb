require 'pry'
module Players
  class Computer < Player
    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      valid_moves.detect{|move| board.valid_move?(move) }
      # AI brain
      # if oppenent has 2 in a row, then play


      # wargames feature
      # run watch computer method 100 times using 100.times
      # use some counter to count each game and return counter
      # bonus use 2 counter for draw,win.



    end

  end

end
