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


# strategy coming:

  # if two next to each other, block/put adjecent to
    # H [[1, 2], [2, 3], [4, 5], [5, 6], [7, 8], [8, 9]]
    # V [[1, 4], [2, 5], [3, 6], [4, 7], [5, 8], [6, 9]]

  # if sandwich, place between
    # H [[1, 3], [4, 6], [7, 9]]
    # V [[1, 7], [2, 8], [3, 9]]
    # D [[1, 9], [3, 7]]

  # if corner, put in center
    # 1 || 3 || 7 || 9

  # if center, put in corner
    # 5

  # else random or adjacent...
