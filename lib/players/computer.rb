module Players

  class Computer < Player
    def move(board)
      computer_move = self.move(@board)
      # computer_move = board.position(@board)
        # if board.valid_move?(computer_move)
        #   # @board.update(computer_move, self)
        # # else
        # #   board.valid_move?(computer_move)
        # end
      # binding.pry
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
