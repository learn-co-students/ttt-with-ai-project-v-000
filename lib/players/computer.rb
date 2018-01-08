module Players

  class Computer < Player

    def move(board)
      @board = board
      @valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      @valid_moves.collect! do |value|
        @board.valid_move?(value)
        @value = value
      end

      player_move = @valid_moves.sample
      @valid_moves[player_move.to_i - 1] = player_move
      player_move

    end

  end

end
