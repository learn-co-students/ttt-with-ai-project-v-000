# module Players
#   class Computer < Player
#     def move(board)
#       num = rand(1..9)
#       num.to_s
#     end
#   end
# end

module Players
  class Computer < Player
    def move(board)
      if board.valid_move?(board.cells[4])
        "1"
      else 
        move(board)
      end
      binding.pry
    end
  end
end

# game = Game.new()
#   board.cells.each do |space|
#     num = rand(1..9)
#       while board.full?
#       if board.valid_move?(space)
#         # board.update(space, game.current_player)
#       # else
#       #   move(board)
#       end
#     end
#     space.to_s
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
