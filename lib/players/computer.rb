module Players
  class Computer < Player
    # your code here

    attr_accessor :last_attempt

    def move(board)
      no_strategy(board)
    end

    def ai_move(board)

      if self.token=="X"
        #player 1 strategy
        player1_strategy(board)
      else
        #player 2 strategy
      end

    end

    def player1_strategy(board)
      if board.isempty?
        next_move = "5"
      end

    end

    def no_strategy(board)
      new_attempt = 1
      if @last_attempt == nil
        @last_attempt = 1
      elsif new_attempt <= @last_attempt
        new_attempt = @last_attempt + 1
      end
      @last_attempt = new_attempt
      return new_attempt.to_s
    end


  end
end
