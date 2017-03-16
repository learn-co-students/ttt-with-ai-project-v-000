module Players
  class Computer < Player
    attr_accessor :choice
    def move(board)
      choice
    end

    def score(game)
      if game.won?
        if game.winner == token
          10
        else
          -10
        end
      end
    end

    def minimax(game)
      return score(game) if game.over?
      scores = []
      moves = []

      avail_moves = []
      game.board.each_with_index{|space, i| avail_moves << i if space == " "}

      avail_moves.each do |move|
        poss_state = game.get_new_state(move)
        scores << minimax(poss_state)
        moves << move
      end

      if game.current_player == self
        max_score_index = scores.each_with_index.max[1]
        choice = moves[max_score_index]
        scores[max_score_index]
      else
        min_score_index = scores.each_with_index.min[1]
        choice = moves[min_score_index]
        scores[min_score_index]
    end
  end
end
