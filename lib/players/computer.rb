module Players
  class Computer < Player

    def opp
      token == "X" ? opp = "O" : opp = 'X'
    end

    def move(board)
      if board.turn_count <= 1
        first_move(board)
      elsif board.turn_count == 4
        block_trick(board)
      elsif winning_move(board)
        winning_move(board)
      elsif block_win(board)
        block_win(board)
      else
        rand_move(board)
      end
    end

    def first_move(board)
      board.cells[4] == " " ? "5" : "1"
    end

    def winning_move(board)
      cells = board.cells
      Game::WIN_COMBINATIONS.each do |combo|
        arr = combo.map { |e| cells[e] == token ? token : e  }
        if arr.count(token) == 2
          potential_win = arr.select{|i| i != token}.pop
          return (potential_win + 1).to_s if cells[potential_win] == " "
        end
      end
      nil
    end

    def block_win(board)
      cells = board.cells
      Game::WIN_COMBINATIONS.each do |combo|
        arr = combo.map { |e| cells[e] == opp ? opp : e  }
        if arr.count(opp) == 2
          potential_win = arr.select{|i| i != opp}.pop
          return (potential_win + 1).to_s if cells[potential_win] == " "
        end
      end
      nil
    end

    def block_trick(board)
      "4"
    end

    def rand_move(board)
      avail_moves = []
      board.cells.each_with_index{|item,index| avail_moves << index if item == " "}
      (avail_moves.shift + 1).to_s
    end

    #   ##beginnings of minimax implementation == something broken in recursion...likey due to req to add 1 and convert move to string
    #
    #   attr_accessor :choice
    #
    #   def move(game)
    #     minimax(game)
    #     choice
    #   end
    #
    #   def score(game)
    #     if game.won?
    #       if game.winner == token
    #         1
    #       else
    #         -1
    #       end
    #     elsif game.draw?
    #       0
    #     end
    #   end
    #
    #   def minimax(game)
    #     return score(game) if game.over?
    #
    #     scores = []
    #     moves = []
    #
    #     avail_moves = []
    #     game.board.cells.each_with_index{|space, i| avail_moves << i if space == " "}
    #     avail_moves.each do |move|
    #       poss_game = game.dup
    #       poss_game.board = game.board.dup
    #       poss_game.board.cells = game.board.cells.dup
    #       poss_game.board.cells[move] = poss_game.current_player.token
    #       scores << minimax(poss_game)
    #       moves << (move + 1).to_s
    #     end
    #
    #     if game.current_player == self
    #       max_score_index = scores.index(scores.max)
    #       choice = moves[max_score_index]
    #       scores[max_score_index]
    #     else
    #       min_score_index = scores.index(scores.min)
    #       choice = moves[min_score_index]
    #       scores[min_score_index]
    #     end
    #   end
  end
end
