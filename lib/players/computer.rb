module Players
  class Computer < Player
    # attr_accessor :game, :board

    # def turn
    #   input = current_player.move(@board)
    #   if @board.valid_move?(input)
    #     @board.update(input, current_player)
    #   else
    #     turn
    #   end

    def move(board)
      # puts "Please enter 1-9:"
      # game.current_player.move(@board)
      # move(@board)
      # computer_move = board.position(input)
      # board.valid_move?(computer_move)
      @board
      # board.valid_move?
      # computer_move = game.current_player.move(@board)
    end
    binding.pry
  end
end

# Implement a `#move` method that accepts a board and returns the move the computer
# wants to make in the form of a 1-9 string. How the computer decides to make that
# move is up to you but it must be capable of returning a valid move at some point.
