module Players

  class Computer < Player

    def move(board)

      move = nil

      if !board.taken?(5)
        move = "5"
      else
        if move == nil
          move = corner_move(board)
        end
        if move == nil
          move = cross_move(board)
        end
      end
      move
    end

    def corner_move(board)
      moves = [1, 3, 7, 9].select{|i| !board.taken?(i)}
      if !moves.empty?
        moves[rand(1..moves.length)]
      else
        nil
      end
    end

    def cross_move(board)
      moves = [2, 4, 6, 8].select{|i| !board.taken?(i)}
      if !moves.empty?
        moves[rand(1..moves.length)]
      else
        nil
      end
    end

  end
end
