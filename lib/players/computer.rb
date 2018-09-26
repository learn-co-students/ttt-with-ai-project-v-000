module Players
  class Computer < Player
    def move(board)
      winning_move(board) || random_move(board)
    end

    def random_move(board)
      rand(1..9).to_s
    end

    def winning_move(board)
      winner = Game::WIN_COMBINATIONS.detect do |combo|
        num_tokens = combo.count { |i| board.cells[i] == self.token }
        num_empty = combo.count { |i| board.cells[i] == " " }
        num_tokens == 2 && num_empty == 1 ? true : false
      end
      winner.detect { |i| board.cells[i] == " " } + 1 if winner
    end
  end
end
