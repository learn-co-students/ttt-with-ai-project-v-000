module Players
  class Computer < Player
    def move(board)
      #play the middle cell first, if it's available
      if board.taken?(5) == false
        "5"
      # if the middle cell is taken, take a corner
      elsif selection = [1,3,7,9].detect {|i| board.taken?(i) == false}
        selection
      else # look for other available spaces
        i = [2,4,6,8].sample
        if board.taken?(i) == false
          i
        end
      end
    end
  end
end
