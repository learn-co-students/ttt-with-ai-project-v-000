module Players

  class Computer < Player
    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      # computer_move = valid_moves.select do |move|
        # if valid_moves[4] == " "
        board.cells.select do |move|
      #       # if board.position(move[4]) == " "
            # if board.valid_move?(move[4])
      #     # if board.valid_move?(move[index])
            board.update(move[4], self)
      #     #  computer_move = board.position(@input)
      # #       computer_move.to_s
      # #       # board.valid_move?(computer_move)
            board.display
      #   # else
          # end
            binding.pry
        end
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
