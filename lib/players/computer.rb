module Players
  class Computer < Player

    def move(board)
      message
      offense(board)
      return @done if @done
      defense(board)
      return @done if @done
      passive(board)
      return @done if @done
    end

    def win_game?(symbol, board)
      sequences = Game::WIN_COMBINATIONS
      sequences.each do |seq|
        return true if seq.all? { |a| board.cells[a] == symbol }
      end
      false
    end

    def offense(board)
      @done = false
      1.upto(9) do |i|
        origin = board.cells[i - 1]
        board.cells[i - 1] = self.token if origin.is_a? Fixnum
        return @done = i if win_game?(self.token, board)
        board.cells[i - 1] = origin
      end
    end

    def defense(board)
      @done = false
      1.upto(9) do |i|
        origin = board.cells[i - 1]
        board.cells[i - 1] = @opponent if origin.is_a? Fixnum
        # put it there if player can win that way.
        return @done = i if win_game?(@opponent, board)
        board.cells[i - 1] = origin
      end
    end

    def passive(board)
      @done = false
      if board.cells[4].is_a? Fixnum
        @done = 5
      else
        rand < 0.51 ? sides(board) : corners(board)
      end
    end

    def sides(board)
      [2, 4, 6, 8].each do |i|
        return @done = i if board.cells[i - 1].is_a? Fixnum
      end
    end

    def corners(board)
      [1, 3, 7, 9].each do |i|
        return @done = i if board.cells[i - 1].is_a? Fixnum
      end
    end

    def message
      puts "AI Player - '#{self.token}' is thinking...."
      sleep(2)
    end
  end
end
