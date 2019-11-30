# module Players
#   class Computer < Player
#     def move(board)
#       computer_move = rand(0..9)
#       until board.valid_move?(computer_move)
#           computer_move = rand(0..9)
#       end
#        return computer_move.to_s
#     end
#   end
# end

module Players
  class Computer < Player

    # WIN_COMBINATIONS = [
    #   [0,1,2],
    #   [3,4,5],
    #   [6,7,8],
    #   [1,4,7],
    #   [0,3,6],
    #   [2,5,8],
    #   [2,4,6],
    #   [0,4,8],
    # ]

    def move(board)
     if draw_move?
       @board.cells[wincombo[0]]
     else computer_move = rand(0..9)
       board.valid_move?(computer_move)
       return computer_move.to_s
     end
    end

  end
end



# 1. Check to see if two of the same tokens are next to each other and if so occupy the third spot next to them.
#
# 2. Check to see if two of the same tokes are in corner spots diagonally across from
# each other and if so occupy the middle spot.
