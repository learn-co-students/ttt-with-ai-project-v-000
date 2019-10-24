module Players

  class Computer < Player
    def move(board)
      game = Game.new()
      # game.current_player
      # computer_move = game.current_player
        # binding.pry
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      # computer_move = valid_moves.select do |move|
        board.cells.select do |comp_move|
          # binding.pry
          comp_move = rand(1..9)
          # if board.full?
           if board.valid_move?(comp_move) == true
            #  binding.pry
            board.update(comp_move, game.current_player)
            board.display
            comp_move.to_s
            # game.over?
          # if game.won?
          #   puts "Congratulations #{winner}!"
          # elsif game.draw?
          #   puts "Cat's Game!"
          # end
          # comp_move = game.current_player.move(rand(1..9))
          # if board.full?
            # game.turn
          else
            move(board)
          #   game.over?
          end
          # binding.pry
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

# def play
#   until over?
#     turn
#   end
#   if won?
#     puts "Congratulations #{winner}!"
#   elsif draw?
#     puts "Cat's Game!"
#   end
# end

# Implement a `#move` method that accepts a board and returns the move the computer
# wants to make in the form of a 1-9 string. How the computer decides to make that
# move is up to you but it must be capable of returning a valid move at some point.
