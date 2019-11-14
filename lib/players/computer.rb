# module Players
#   class Computer < Player
#     def move(board)
#        board.cells.each do |space|
#        computer_move = board.cells.index(space) + 1
#         if computer_move.to_s == "5"
#           if board.valid_move?(computer_move)
#             return computer_move.to_s
#           end
#         elsif computer_move.to_s == "1" || computer_move.to_s == "3" || computer_move.to_s == "7" ||
#             computer_move.to_s == "9"
#           if board.valid_move?(computer_move)
#             return computer_move.to_s
#           end
#         elsif computer_move.to_s == "2" || computer_move.to_s == "4" || computer_move.to_s == "6" ||
#             computer_move.to_s == "8"
#           if board.valid_move?(computer_move)
#             return computer_move.to_s
#           end
#         end
#         # binding.pry
#       end
#     end
#   end
# end

# module Players
#   class Computer < Player
#     def move(board)
#        board.cells.each do |space|
#        computer_move = board.cells.index(space) + 1
#         if board.valid_move?(computer_move)
#           return computer_move.to_s
#         end
#         # binding.pry
#       end
#     end
#   end
# end

module Players
  class Computer < Player
    def move(board)
       board.cells.select do |space|
        computer_move1 = board.cells.index(space) + 5
          if board.valid_move?(computer_move1)
          # binding.pry
          return computer_move1.to_s
          end

          elsif computer_move2 = board.cells.index(space) + 1 || board.cells.index(space) + 3 ||
          board.cells.index(space) + 7 || board.cells.index(space) + 9
            if board.valid_move?(rand(computer_move2))
              return computer_move2.to_s
            end

          elsif computer_move3 =  computer_move3 = board.cells.index(space) + 2 ||board.cells.index(space) + 4 ||
          board.cells.index(space) + 6 || board.cells.index(space) + 8
            if board.valid_move?(rand(computer_move3))
              return computer_move3.to_s
            end
          end
      end
    end
  end
end
