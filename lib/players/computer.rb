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
    def move(board)
      computer_move = rand(0..9)
       board.valid_move?(computer_move)
       return computer_move.to_s
    end
  end
end

# def won?
#   WIN_COMBINATIONS.find do |winner|
#     @board.cells[winner[0]] == @board.cells[winner[1]] ||
#     @board.cells[winner[3]] == @board.cells[winner[4]] ||
#     @board.cells[winner[6]] == @board.cells[winner[7]] ||
#     @board.cells[winner[1]] == @board.cells[winner[2]] ||
#     @board.cells[winner[4]] == @board.cells[winner[5]] ||
#     @board.cells[winner[7]] == @board.cells[winner[8]] ||
#     @board.cells[winner[0]] == @board.cells[winner[3]] ||
#     @board.cells[winner[1]] == @board.cells[winner[4]] ||
#     @board.cells[winner[3]] == @board.cells[winner[5]] ||
#     @board.cells[winner[3]] == @board.cells[winner[6]] ||
#     @board.cells[winner[4]] == @board.cells[winner[7]] ||
#     @board.cells[winner[5]] == @board.cells[winner[8]] ||
#     @board.cells[winner[2]] == @board.cells[winner[4]] ||
#     @board.cells[winner[4]] == @board.cells[winner[6]] ||
#     @board.cells[winner[0]] == @board.cells[winner[4]] ||
#     @board.cells[winner[4]] == @board.cells[winner[8]] ||
#     @board.cells[winner[0]] == @board.cells[winner[2]] ||
#     @board.cells[winner[2]] == @board.cells[winner[8]] ||
#     @board.cells[winner[2]] == @board.cells[winner[6]] ||
#     @board.cells[winner[3]] == @board.cells[winner[5]] ||
#     @board.cells[winner[1]] == @board.cells[winner[7]] ||
#     @board.cells[winner[0]] == @board.cells[winner[8]] ||
#     @board.cells[winner[6]] == @board.cells[winner[8]] ||
#     @board.cells[winner[0]] == @board.cells[winner[6]] ||
#     (@board.cells[winner[0]] == "X" || @board.cells[winner[0]] == "O")
#   end
# end
#
# 1. Check to see if two of the same tokens are next to each other and if so occupy the third spot next to them.
#
# 2. Check to see if two of the same tokes are in corner spots diagonally across from
# each other and if so occupy the middle spot.
