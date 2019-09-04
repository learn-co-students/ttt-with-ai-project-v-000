module Players
  class Computer < Player
    attr_reader :enemy_token

    WIN_COMBINATIONS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]

    def move(board)
      self.token == "X" ? @enemy_token = "O" : @enemy_token = "X"
      original_board = board

      best_move = minimax(original_board, self.token)["index"] + 1

      best_move.to_s
    end

    def minimax(new_board, token)
      empties = get_empties(new_board)

      if self.winner(new_board) == self.token
        return {"score" => 10}
      elsif self.winner(new_board) == self.enemy_token
        return {"score" => -10}
      elsif empties.length == 0
        return {"score" => 0}
      end

      possible_moves = []

      empties.each do |index|
        this_move = {}
        this_move["index"] = index

        new_board.cells[index] = token

        if token == self.token
          result = minimax(new_board, enemy_token)
        else
          result = minimax(new_board, self.token)
        end

        this_move["score"] = result["score"]

        new_board.cells[index] = " "

        possible_moves << this_move
      end

      if (token == self.token)
        possible_moves.max_by {|move| move["score"]}
      else
        possible_moves.min_by {|move| move["score"]}
      end

    end

    def get_empties(board)
      (0..8).select {|index| !board.taken?(index+1)}
    end

    def won?(board)
      WIN_COMBINATIONS.detect do |combo|
        board.cells[combo[0]] != " " &&
        board.cells[combo[0]] == board.cells[combo[1]] &&
        board.cells[combo[1]] == board.cells[combo[2]]
      end
    end

    def winner(board)
      self.won?(board) ? board.cells[self.won?(board)[0]] : nil
    end

  end
end
