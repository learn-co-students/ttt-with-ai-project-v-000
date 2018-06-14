module Players
  class Computer < Player

    def move(board)

      @pattern = Game::WIN_COMBINATIONS
      @board = board
      @opponent = self.token == "X" ? "O" : "X"

      make_move = nil

      if defense
      make_move = defense
      elsif move_option
        make_move = move_option
      end
      make_move
    end

    def defense
      result = nil
      @pattern.detect do |combo|
        if @board.cells[combo[0]] == @opponent && @board.cells[combo[1]] == @opponent && !@board.taken?("#{combo[2] + 1}")
          result = combo[2] + 1
        elsif @board.cells[combo[0]] == @opponent && @board.cells[combo[2]] == @opponent && !@board.taken?("#{combo[1] + 1}")
          result = combo[1] + 1
        elsif @board.cells[combo[2]] == @opponent && @board.cells[combo[1]] == @opponent && !@board.taken?("#{combo[0] + 1}")
          result = combo[0] + 1
        end
        end
        result
      end

    def move_option
      if @board.position("5") == self.token || !@board.taken?("5")
        if !@board.taken?("5")
          "5"
        else [2, 4, 6, 8].detect { |n| !@board.taken?(n)} || [1, 3, 7, 9].detect { |n| !@board.taken?(n)}
        end
      elsif @board.position("5") == @opponent
        [1, 3, 7, 9].detect { |n| !@board.taken?(n)} || [2, 4, 6, 8].detect { |n| !@board.taken?(n)}
      end
    end

end
end
