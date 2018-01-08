module Players

  class Computer < Player

    def move(board)
      @board = board
      @valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      @valid_moves.collect! do |value|
        @board.valid_move?(value)
        @value = value
      end

      input = @valid_moves.sample
      @board.update(input, self)
      @board.cells
      @valid_moves[@value.to_i - 1] = @value
      #expect(valid_moves).to include(computer_move)

    end

  end

end
