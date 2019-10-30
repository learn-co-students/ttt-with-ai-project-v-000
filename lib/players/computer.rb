module Players
  class Computer < Player
    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      valid_moves.each do |space|
        if board.valid_move?(valid_moves[space.to_i - 1]) == "5"
          valid_moves[space.to_i]
        # elsif board.valid_move?(valid_moves[space.to_i - 1]) == "1" || board.valid_move?(valid_moves[space.to_i - 1]) == "3" ||
        #   board.valid_move?(valid_moves[space.to_i - 1]) == "7" || board.valid_move?(valid_moves[space.to_i - 1]) == "9"
        #   valid_moves[space.to_i]
        # elsif board.valid_move?(valid_moves[space.to_i - 1]) == "2" || board.valid_move?(valid_moves[space.to_i - 1]) == "4" ||
        #   board.valid_move?(valid_moves[space.to_i - 1]) == "6" || board.valid_move?(valid_moves[space.to_i - 1]) == "8"
        #   valid_moves[space.to_i]
        end
        binding.pry
      end
    end
  end
end

# module Players
#   class Computer < Player
#     def move(board)
#       # num = rand(1..9)
#       # num.to_s
#     end
#   end
# end
# This code right above passes all the tests



# module Players
#   class Computer < Player
#     def move(board)
#       board.cells.each do |space|
#
#           if board.valid_move?(space)
#         # board.update(space, game.current_player)
#           num = rand(1..9)
#             board.cells[num].to_s
#           # else
#           #   move(board)
#           end
#         end
#       end
#     end
#     # space.to_s
#   end

# human move method
# def move(board)
#   puts "Please enter 1-9:"
#   gets.strip
# end
##### 'players/computer.rb' - `Players::Computer`
# Define a class `Players::Computer` that represents a computer player of Tic-tac-toe.
# Implement a `#move` method that accepts a board and returns the move the computer wants
# to make in the form of a 1-9 string. How the computer decides to make that move is up to you
# but it must be capable of returning a valid move at some point.
