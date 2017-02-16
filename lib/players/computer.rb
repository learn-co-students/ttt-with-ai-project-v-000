module Players
  class Computer < Player
    def move(board)
      best_initial_move = 5
      next_best_moves = [1,3,7,9]
      move = nil

      if !board.taken?(best_initial_move)
        # if best move available then set move to that
        move = best_initial_move
      else
        # if no move is found it is nil/empty
        move = next_best_moves.find { |move| !board.taken?(move) }
      end

      # if no move choose a random number to try
      move ? move.to_s : rand(1..9).to_s
    end
  end
end