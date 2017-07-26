# module Players
#   class Computer < Player
#     WIN_COMBINATIONS = [
#       [0,1,2], #Top row
#       [3,4,5], #Middle row
#       [6,7,8], #Bottom row
#       [0,3,6], #First column
#       [1,4,7], #Second column
#       [2,5,8], #Third column
#       [0,4,8], #Diagonal left-to-right
#       [6,4,2]  #Diagonal right-to-left
#     ]
#     def move(board)
#       move = nil
#       if !board.taken?(5)
#         move = "5"
#       elsif board.turn_count == 1
#         move = "1"
#       elsif board.turn_count == 2
#         move = [3,7,9].detect{|i| !board.taken?(i)}.to_s
#       elsif board.turn_count == 3
#         move = board.cells.each_with_index{|token, i| }
#       end
#     end
#   end
# end
# # move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s

module Players
  class Computer < Player

    def move(board)
      if  board.cells[4] == " "
        "5"
      elsif board.cells[0] == " "
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      elsif board.cells[0,8] == ["X", "X"]
        "5"
      elsif board.cells[0,2] == ["X", "X"]
        "2"
      elsif board.cells[0,6] == ["X", "X"]
        "4"
      elsif board.cells[6,8] == ["X", "X"]
        "8"
      elsif board.cells[8,2] == ["X", "X"]
        "6"
      end

      #[[0,2], [0,6], [6,8], [8,2]]
    end
#
  end
end
