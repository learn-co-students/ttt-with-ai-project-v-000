module Players
  class Computer < Player
    def move(board)
      computer_move = rand(0..9)
      until board.valid_move?(computer_move)
          computer_move = rand(0..9)
      end
       return computer_move.to_s
    end
  end
end



# 1. Check to see if two of the same tokens are next to each other and if so occupy the third spot next to them.
#
# 2. Check to see if two of the same tokes are in corner spots diagonally across from
# each other and if so occupy the middle spot.
