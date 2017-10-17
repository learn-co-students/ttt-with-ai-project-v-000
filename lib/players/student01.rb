module Players
  class Student01 < Player
    attr_accessor :choice

    def move(game)
       return [1,3,7,9].sample.to_s if game.class == Board
       return [1,3,7,9].sample if game.board.turn_count == 0
       min_max(game.clone)
       input_maker
    end

    def input_maker
      (self.choice.first + 1).to_s
    end

    def min_max(game)
      board = game.board
      return score(game) if game.over? != false

      scores = {}

      get_possible_moves(board).each do |move|
        possible_game = get_new_state(game, move)
        scores[move] = min_max(possible_game)
      end

      if game.current_player.token == self.token
        self.choice = scores.max_by {|move, score| score}
        return scores.values.max
      else
        return scores.values.min
      end

    end

    def score(game)
      return 10 if game.winner == self.token
      return -10 if game.winner == switch(token)
      return 0
    end

    def get_possible_moves(board)
      moves = []
      board.cells.each_with_index do |cell, index|
          moves << index if cell == " "
      end
      moves
    end

    def get_new_state(game, move)
      new_game_state = game.clone
      new_game_state.board.move(move, game.current_player.token)
      new_game_state
    end

  end
end
