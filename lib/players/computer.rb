module Players

  class Computer < Player
    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      computer_move = valid_moves.each { |move| move.to_s }
          #  computer_move = board.position(@input)
        if board.valid_move?(computer_move)
      #       computer_move.to_s
      #       # board.valid_move?(computer_move)
          board.update(computer_move, self)
          board.display
        # else

      #   #   # move(board)
      #   #   # board.valid_move?(computer_move)
      #   #   @input.to_s
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
