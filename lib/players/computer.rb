require 'pry'

module Players

  class Computer < Player

    def move(board)
      move = nil #declare move var
      if board.turn_count == 0   #if 1st move, play corner 1
        move = "1"  #rspec is testing against strings
      elsif board.turn_count == 2 #if 2nd move, play center, if center taken, play corner 1
        if !board.taken(5)
          move = "5"
        else
          move = "1"
        end
        binding.pry
      elsif board.turn_count == 3 #if 3rd move, play first open corner: iterate through all corners, test against taken?
        move = ["1","3","7","9"].detect {|position| !board.taken?(position)}
      else #play first open position
        move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
      end
      move #return move var
    end

  end

end
