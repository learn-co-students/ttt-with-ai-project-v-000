module Players
  class Computer < Player

    def move(board)
      board.suggest_win(self.token)
    end

  end
end
