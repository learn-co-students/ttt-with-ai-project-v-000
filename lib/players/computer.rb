module Players

  class Computer < Player


    def move(board)
      possible_positions = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      position_number = possible_positions.sample
    end

  end

end


#     def move(board)
#       if !board.taken?("5")
#         board = "5"
#       elsif board.turn_count == 1
#         move = "1"
#       elsif board.turn_count == 2
#         move = [1, 3, 7, 9].detect do |position|
#           !board.taken?(position).to_s
#         end
#       elsif board.turn_count == 3 && (board.position("1") == board.position("9") || board.position("3") == board.position("7"))
#         move = "2"
#       else
#         Game::WIN_COMBINATIONS.detect do |win_combo|
#             position_1 = (win_combo[0] + 1).to_s
#             position_2 = (win_combo[1] + 1).to_s
#             position_3 = (win_combo[2] + 1).to_s
#             indexes = []
#             if win_combo.collect do |index|
#                 index == " "
#                 indexes << index
#         end
#       end
#     end

#   end

# end


#     1 | 2 | 3
#     ----------
#     4 | 5 | 6
#     ----------
#     7 | 8 | 9


#   WIN_COMBINATIONS = [
#     [0, 1, 2], # Top row = WIN_COMBINATIONS[0]
#     [3, 4, 5], # Middle row = WIN_COMBINATIONS[1]
#     [6, 7, 8], # Bottom row = WIN_COMBINATIONS[2]
#     [0, 3, 6], # Left column = WIN_COMBINATIONS[3]
#     [1, 4, 7], # Middle column = WIN_COMBINATIONS[4]
#     [2, 5, 8], # Right column = WIN_COMBINATIONS[5]
#     [0, 4, 8], # Left-to-right Diagonal = WIN_COMBINATIONS[6]
#     [2, 4, 6] # Right-to-left Diagonal = WIN_COMBINATIONS[7]
#   ]
