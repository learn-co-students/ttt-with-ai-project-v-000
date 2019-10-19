module Players

  class Computer < Player
    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      # computer_move = valid_moves.select do |move|
        valid_moves.each_with_index do |move, index|
          if board.valid_move?(move[index])
            board.update(move, self)
          #  computer_move = board.position(@input)
      #       computer_move.to_s
      #       # board.valid_move?(computer_move)
            board.display
            binding.pry
        # else
          end
          # binding.pry
      #   #   # move(board)
      #   #   # board.valid_move?(computer_move)
      #   #   @input.to_s
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
