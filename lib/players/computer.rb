module Players

  class Computer < Player

    def move(board)
      move = nil
      if !board.taken?(5)
        move = '5'
      else
        move = (best_move(board, self.token) + 1).to_s
      end
    end

    def best_move(board, token)
      win(board) || block(board) || corner(board) || random_choice
    end

    def win(board)
      if winning_combo = winning_combo?(board, self.token)
        winning_combo.detect { |cell| !board.taken?(cell+1)}
      end
    end

    def winning_combo?(board, token)
      Game::WIN_COMBINATIONS.detect do |combo|
        (
        (board.cells[combo[0]] == token &&
        board.cells[combo[1]] == token) &&
        !board.taken?(combo[2]+1)
        ) ||
        (
        (board.cells[combo[1]] == token &&
        board.cells[combo[2]] == token) &&
        !board.taken?(combo[0]+1)
        ) ||
        (
        (board.cells[combo[0]] == token &&
        board.cells[combo[2]] == token) &&
        !board.taken?(combo[1]+1)
        )
      end
    end

    def opposing_token
      self.token == "X" ? "O" : "X"
    end

    def block(board)
      if blocking_combo = winning_combo?(board, opposing_token)
        blocking_combo.detect { |i| !board.taken?(i+1)}
      end
    end

    def corner(board)
      [0, 2, 6, 8].detect { |i| !board.taken?(i+1)}
    end

    def random_choice
      (0..8).to_a.sample
    end

  end
end
#test
#load "config/environment.rb"
