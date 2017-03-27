module Players

  attr_accessor :board, :game

  class Computer < Player
    # your code here
    def initialize(token, game)
      super(token)
      @game = game
    end

    def move(board)

      @board = board
  #    check if win game?
      for i in 1..9
        input = i.to_s
        if @board.valid_move?(input)
          @board.cells[i-1] = self.token
          if @game.won?
            @board.cells[i-1] = " "
            return input
          else
            @board.cells[i-1] = " "
          end
        end
      end
      #block opponent
      for i in 1..9
        input = i.to_s
        if @board.valid_move?(input)
          opponent_token = (self.token == "X" ? "O" : "X")
          @board.cells[i-1] = opponent_token
          if @game.won?
            @board.cells[i-1] = " "
            return input
          else
            @board.cells[i-1] = " "
          end
        end
      end
      #find best pos
      best_pos = [5,1,3,7,9,2,4,6,8]

      best_pos.each do |i|
        input = i.to_s
        if @board.valid_move?(input)
          sleep(0.5)
          return input
        end
      end
    end

  end
end
