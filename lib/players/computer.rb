module Players
  class Computer < Player

    WINNING_SPACES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    WINNING_PRIORITIES = [[0, 1, 2], [0, 2, 1], [1, 2, 0]]

    def move(board)

      if board.valid_move?("1")
        move = "1"
      else
        WINNING_SPACES.each do |space|
          WINNING_PRIORITIES.each do |priority|
            if (@board.cells[space[priority[0]]] != " ")  && (@board.cells[space[priority[1]]] != " ")
              next_space = space[priority[2]]
            else
              nil
            end
          end
        end
        nil
      end
    end

  end

end
