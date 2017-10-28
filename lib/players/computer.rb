require 'pry'

module Players
  class Computer < Player
    Players::Computer

    def move(board)
      move = ""


      puts "Please enter a number from 1..9"



      # poss_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample

       ["1","5"].sample
       ["3", "5"].sample
       ["2", "4"].sample
       ["3", "5", "7", "9"].sample
       ["2","4","6","8"].sample

      # poss_moves_new = ["1", "2", "3"].sample
      # poss_moves_mid = ["4", "5", "6"].sample
      # poss_moves_low = ["7", "8", "9"].sample
      # if board.valid_move?(poss_moves_first).to_s
      #   move = poss_moves_first

      # if board.valid_move?(5).to_s
      #                move == 5
      #              else
      #                move != 5
      #              end
      # if board.taken?(5) && board.valid_move?(1).to_s
      #             move == 1
      #                else
      #             move != 1
      #                end
      #                binding.pry
      #     if board.taken?(5) && board.taken?(1) && board.valid_move?(3).to_s
      #                   move == 3
      #                 else
      #                   move != 3
      #                   end
      #     if board.taken?(5) && board.taken?(1) && board.taken?(3) && board.valid_move?(7).to_s
      #                 move == 7
      #               else
      #                 move != 7
      #                 end

# binding.pry
#           if board.position(1) == board.position(3) && board.position(1) != " " && board.valid_move?(2).to_s
#                   move = poss_moves_new
#                   binding.pry
#           elsif board.position(1) == board.position(2) && board.position(1) != " " && board.valid_move?(3).to_s
#                             move = poss_moves_new
#
#           elsif board.position(2) == board.position(3) && board.position(2) != " " && board.valid_move?(1).to_s
#                             move = poss_moves_new
#           elsif board.position(4) == board.position(5) && board.position(4) != " " && board.valid_move?(6).to_s
#                                     move = poss_moves_mid
#                                     binding.pry
#               elsif board.position(4) == board.position(6) && board.position(4) != " " && board.valid_move?(5).to_s
#                                               move = poss_moves_mid
#
#               elsif board.position(5) == board.position(6) && board.position(5) != " " && board.valid_move?(4).to_s
#                                               move = poss_moves_mid
#                           elsif board.valid_move?(poss_moves_mid).to_s
#                             move = poss_moves_mid
#                           elsif board.valid_move?(poss_moves_low).to_s
#                             move = poss_moves_low
#
#       elsif board.valid_move?(poss_moves).to_s
#         move = poss_moves
# end
# end
# end
end
end
end
#       else
#         move != 1
#       end
#
#     if board.turn_count == 1 && board.valid_move?(poss).to_s
#             move = 2
#           else
#             move != 2
#           end
#
#       if board.turn_count < 10 && board.valid_move?(3).to_s
#             move = 3
#           else
#             move != 3
#           end
# #binding.pry
#       if board.turn_count < 10 && board.valid_move?(4).to_s
#       else
#         move != 4
#       end
#       if board.turn_count < 10 && board.valid_move?(5).to_s
#             move = 5
#           else
#             move != 5
#           end
#           if board.turn_count < 10 && board.valid_move?(6).to_s
#                 move = 6
#               else
#                 move != 6
#               end
#               if board.turn_count < 10 && board.valid_move?(7).to_s
#                     move = 7
#                   else
#                     move != 7
#                   end
#                   if board.turn_count < 10 && board.valid_move?(8).to_s
#                         move = 8
#                       else
#                         move != 8
#                       end
#                       if board.turn_count < 10 && board.valid_move?(9).to_s
#                             move = 9
#                           else
#                             move != 9
#                           end
#
#                   binding.pry
# if board.turn_count < 10 && board.position(4) == board.position(6) && board.valid_move?(5).to_s
#      move = 5
#      else
#      move != 5
#    end
      #  if board.turn_count < 10 && board.position(1) == board.position(3) && board.valid_move?(2).to_s
      #       move = 2
      #       else
      #       move != 2
      #     end
#       if board.turn_count < 10 && board.position(3) == board.position(9) && board.valid_move?(6).to_s
#             move = 6
#           else
#             move != 6
#           end
#
#       if board.turn_count < 10 && board.position(1) == board.position(7) && board.valid_move?(4).to_s
#             move = 4
#           else
#             move != 4
#           end
#           if board.turn_count < 10 && board.position(2) == board.position(8) && board.valid_move?(5).to_s
#                 move = 5
#               else
#                 move != 5
#               end
#               if board.turn_count < 10 && board.position(3) == board.position(7) && board.valid_move?(5).to_s
#                     move = 5
#                   else
#                     move != 5
#                   end
#                   if board.turn_count < 10 && board.position(1) == board.position(9) && board.valid_move?(5).to_s
#                         move = 5
#                       else
#                         move != 5
#                       end
#                       if board.turn_count < 10 && board.position(7) == board.position(9) && board.valid_move?(8).to_s
#                             move = 8
#                           else
#                             move != 8
#                           end
# #  Game::WIN_COMBINATIONS.each do |win|
# #           win.select do |slot|
# #           if board.position(slot+1) == token && win.any?{ |slot| board.position(slot+1) == " "}
# #               input = win.select{|slot| !board.taken?(slot+1)}.to_s
# #
# # #
# end
