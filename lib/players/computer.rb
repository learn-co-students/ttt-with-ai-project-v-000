module Players
  class Computer < Player
    def move(board)
      if !board.taken?("5")
        "5"
      else
        next_move = false

        loop do
          if !next_move
            next_move = ["1","3","4","6","7","9"].sample
          else
            next_move = rand(1..9).to_s
          end

          break if !board.taken?(next_move)
        end

        next_move
      end
    end

  end
end
