module Players
  class Computer < Player

    def move(board)
      first_move = 5 # Center Position
      next_best_moves = [1, 3, 7, 9] #All corner positions
      move = nil
      if !board.taken?(first_move)
        move = first_move
      elsif
        move = next_best_moves.detect { |m| !board.taken?(m)}
      end

      if move
        move.to_s
      else
        move = rand(1..9).to_s
      end
    end

  end
end
