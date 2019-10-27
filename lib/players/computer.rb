module Players
  class Computer < Player
    def move(board)
      game = Game.new()
        # board.cells.each do |comp_move|
          board.cells.sort
          binding.pry
          rand(comp_move)
          while board.full?
            if board.valid_move?(comp_move)
              board.update(comp_move, game.current_player)
              # comp_move.to_s
            else
              move(board)
            end
          end
        # end
    end
  end
end

# a.combination(n)
# computer_move = computer.move(board)
# Implement a `#move` method that accepts a board and returns the move the computer
# wants to make in the form of a 1-9 string. How the computer decides to make that
# move is up to you but it must be capable of returning a valid move at some point.
