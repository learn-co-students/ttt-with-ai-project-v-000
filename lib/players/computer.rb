module Players

  class Computer < Player
    def move(board)
      game = Game.new()
        board.cells.map do |comp_move|
          comp_move = rand(1..9)
          while board.full?
            # binding.pry
            if board.valid_move?(comp_move)
            # if board.valid_move?(comp_move) == true
              board.update(comp_move, game.current_player)
              board.cells
              # board.cells
            else
              move(board)
            end
          end
          comp_move.to_s
            # binding.pry
        end
    end
  end
end

# Implement a `#move` method that accepts a board and returns the move the computer
# wants to make in the form of a 1-9 string. How the computer decides to make that
# move is up to you but it must be capable of returning a valid move at some point.
