module Players

  class Computer < Player
    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]


      current_player = @board.turn_count % 2 == 0 ? player_1 : player_2


      # computer_move = valid_moves.select do |move|
        # if valid_moves[4] == " "

        # valid_moves.select {rand(0..10)}
        board.cells.select do |move|
      #       # if board.position(move[4]) == " "
            move = rand(1..9)
            # board.valid_move?(move[4])
          if board.valid_move?(move)
            board.update(move, current_player)
      #     #  computer_move = board.position(@input)
      # #       computer_move.to_s
      # #       # board.valid_move?(computer_move)
            board.display
        else
          end
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
