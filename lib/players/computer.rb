module Players

  class Computer < Player
    # This is a very dumb implementation of the AI.
    # Improve by using Minimax Algorithm with Alpha-Beta Pruning
    # This implementation of minimax should be recursive.
    # Remember for your scoring, on the first move, corners > center > edge moves
    # Then, rank according to Win, Block, Fork, Block Fork, etc.

    def move(board=[])
      computer_move = rand(1..9).to_s
      puts "Computer's Move"
      sleep(1)
      computer_move
    end
  end

end
