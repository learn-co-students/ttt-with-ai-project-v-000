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

# module Players
#   class Computer < Player
#
#     DRAW_COMBINATIONS = [
#       [0,1,2],
#       [3,4,5],
#       [6,7,8],
#       [1,4,7],
#       [0,3,6],
#       [2,5,8],
#       [2,4,6],
#       [0,4,8],
#     ]
#
#     def draw_move?
#       DRAW_COMBINATIONS.find do |drawer|
#         if @board.cells[drawer[0]] == @board.cells[drawer[1]]
#           computer_move = @board.cells[drawer[2]] ||
#          @board.cells[drawer[3]] == @board.cells[drawer[4]]
#           computer_move = @board.cells[drawer[5]] ||
#          @board.cells[drawer[6]] == @board.cells[drawer[7]]
#           computer_move = @board.cells[drawer[8]] ||
#          @board.cells[drawer[1]] == @board.cells[drawer[2]]
#           computer_move = @board.cells[drawer[0]] ||
#          @board.cells[drawer[4]] == @board.cells[drawer[5]]
#           computer_move = @board.cells[drawer[3]] ||
#          @board.cells[drawer[7]] == @board.cells[drawer[8]]
#           computer_move = @board.cells[drawer[6]] ||
#          @board.cells[drawer[1]] == @board.cells[drawer[4]]
#           computer_move = @board.cells[drawer[7]] ||
#          @board.cells[drawer[0]] == @board.cells[drawer[3]]
#           computer_move = @board.cells[drawer[6]] ||
#          @board.cells[drawer[2]] == @board.cells[drawer[5]]
#           computer_move = @board.cells[drawer[8]] ||
#          @board.cells[drawer[3]] == @board.cells[drawer[6]]
#           computer_move = @board.cells[drawer[0]] ||
#          @board.cells[drawer[4]] == @board.cells[drawer[7]]
#           computer_move = @board.cells[drawer[1]] ||
#          @board.cells[drawer[5]] == @board.cells[drawer[8]]
#           computer_move = @board.cells[drawer[2]] ||
#          @board.cells[drawer[2]] == @board.cells[drawer[4]]
#           computer_move = @board.cells[drawer[6]] ||
#          @board.cells[drawer[4]] == @board.cells[drawer[6]]
#           computer_move = @board.cells[drawer[2]] ||
#          @board.cells[drawer[0]] == @board.cells[drawer[4]]
#           computer_move = @board.cells[drawer[8]] ||
#          @board.cells[drawer[4]] == @board.cells[drawer[8]]
#           computer_move = @board.cells[drawer[0]] ||
#          @board.cells[drawer[0]] == @board.cells[drawer[2]]
#           computer_move = @board.cells[drawer[1]] ||
#          @board.cells[drawer[3]] == @board.cells[drawer[5]]
#           computer_move = @board.cells[drawer[4]] ||
#          @board.cells[drawer[6]] == @board.cells[drawer[8]]
#           computer_move = @board.cells[drawer[7]] ||
#          @board.cells[drawer[0]] == @board.cells[drawer[6]]
#           computer_move = @board.cells[drawer[3]] ||
#          @board.cells[drawer[1]] == @board.cells[drawer[7]]
#           computer_move = @board.cells[drawer[4]] ||
#          @board.cells[drawer[2]] == @board.cells[drawer[8]]
#           computer_move = @board.cells[drawer[5]] ||
#          @board.cells[drawer[2]] == @board.cells[drawer[6]]
#           computer_move = @board.cells[drawer[4]] ||
#          @board.cells[drawer[0]] == @board.cells[drawer[8]]
#           computer_move = @board.cells[drawer[4]] ||
#         (@board.cells[drawer[0]] == "X" || @board.cells[drawer[0]] == "O")
#       end
#      end
#     end
#
#
#     def move(board)
#      if draw_move?
#        @board.cells[wincombo[0]]
#      else computer_move = rand(0..9)
#        board.valid_move?(computer_move)
#        return computer_move.to_s
#      end
#     end
#
#   end
# end



# 1. Check to see if two of the same tokens are next to each other and if so occupy the third spot next to them.
#
# 2. Check to see if two of the same tokes are in corner spots diagonally across from
# each other and if so occupy the middle spot.
