module Players
  class Computer < Player

    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      random_move = valid_moves.sample

      if board.taken?(random_move) == false
        move = random_move
      end
#
#       move =nil
#
#
# #   # if the middle of the board is empty take it
#       if board.taken?("5") == false
#         move="5"
#
#       elsif board.turn_count == 1 && board.taken?("5")
#         move = "1"
#
#     #2nd move hit the corners
#       elsif board.turn_count == 1 && board.taken?("1") != true
#         move = "1"
#       elsif board.turn_count == 1 && board.taken?("3") != true
#         move = "3"
#       elsif board.turn_count == 1 && board.taken?("7") != true
#         move = "7"
#       elsif board.turn_count == 1 && board.taken?("9") != true
#         move = "9"
#
#       #don't fall for the corner trick
#       elsif board.turn_count == 2
#         board.taken?("1") && board.taken?("9")
#         move = "2"
#       elsif board.turn_count == 2
#         board.taken?("3") && board.taken?("7")
#         move = "8"
#
#
#
#     #     #look for a win combo
#     #   binding.pry
#
#       end
#

    end
  end
end
