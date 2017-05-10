module Players
  class Computer < Player

    attr_accessor = :player, :opponent, :board

    # def score(board)
    #   if board.won?(self.player)
    #     return 10
    #   elsif board.won?(self.opponent)
    #     return -10
    #   else
    #     return 0
    #   end
    # end
    #
    # def minmax(board)
    #   return score(board) if game.over?
    #   scores = []
    #   moves = []

    def move(board)
      # binding.pry
      move = board.available_moves.sample + 1
      move.to_s


    end
  end
end
