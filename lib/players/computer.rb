require_relative "../player.rb"
require "pry"

# module Players
#     class Computer < Player
#         def move(board, game = Game.new)
#             computer_move = (1..9).to_a.sample
#             until board.move_valid? computer_move
#                 computer_move = (1..9).to_a.sample
#             end
#         end
#     end
# end