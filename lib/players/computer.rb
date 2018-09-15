module Players
  class Computer < Player
    def move(board, game = Game.new)
      corners = ["1", "3", "7", "9"]
      if board.turn_count == 0
        choice = corners.sample
      elsif board.turn_count == 1
        choice = "5"
      end
      until  board.valid_move?(choice)
        choice = (1..9).to_a.sample.to_s
      end
      choice
    end
  end
end