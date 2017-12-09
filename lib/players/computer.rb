class Players

  class Computer < Player

    def move(board)
      valid_moves = []
      count = 0
      while count < 10
        count += 1
        index = count - 1
        if board.cells[index] == " "
          valid_moves << count.to_s
        end
      end
      valid_moves[0]
    end

  end
end
