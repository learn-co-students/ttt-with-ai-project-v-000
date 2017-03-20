module Players
  class Computer < Player
    attr_accessor :choice

    def move(game)
      poss_game = game.dup
      minimax(poss_game)
      choice
    end
    #beginnings of minimax implementation -- requires moving methods from game engine into board class
    def score(game)
      if game.won?
        if game.winner == token
          1
        else
          -1
        end
      elsif game.draw?
        0
      end
    end

    def minimax(game)
      return score(game) if game.over?

      scores = []
      moves = []

      avail_moves = []
      game.board.cells.each_with_index{|space, i| avail_moves << i if space == " "}

      avail_moves.each do |move|
        game.board = game.board.dup
        game.board.cells[move] = game.current_player.token
        scores << minimax(game)
        moves << move
      end

      if game.current_player == self
        max_score_index = scores.index(scores.max)
        choice = moves[max_score_index]
        scores[max_score_index]
      else
        min_score_index = scores.index(scores.min)
        choice = moves[min_score_index]
        scores[min_score_index]
      end
    end
  end
end
