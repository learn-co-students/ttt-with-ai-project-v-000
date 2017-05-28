module Players
  class Computer < Player

    attr_reader :difficulty

    def initialize(token, difficulty = 1)
      super(token)
      @difficulty = difficulty
    end

    def move(board)
      puts "difficulty: #{difficulty}"
      # temporarily brute-forces a choice
      selected = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
      move(board) if !board.valid_move?(selected)
      selected
    end

    def poor_move(board)
    end

    def best_move(board)
    end
  end
end