module Players

  class Computer < Player
    def move(board)
      # @board == nil
      # board.cells[0] == " "
      # board.position(@board) == " "
      computer_move = board.position(@input)
      # computer_move = board.cells[0]
        if board.valid_move?(computer_move) && board.taken?(computer_move)
            computer_move.to_s
            # board.valid_move?(computer_move)
          # @board.update(valid_moves, self)
          # @input.to_s
        # else
        #   # move(board)
        #   # board.valid_move?(computer_move)
        #   @input.to_s
        end
      binding.pry
    end
  end

end

# def turn
#   input = current_player.move(@board)
#   if @board.valid_move?(input)
#     @board.update(input, current_player)
#   else
#     turn
#   end

# Implement a `#move` method that accepts a board and returns the move the computer
# wants to make in the form of a 1-9 string. How the computer decides to make that
# move is up to you but it must be capable of returning a valid move at some point.
