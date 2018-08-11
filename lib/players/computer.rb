
module Players
  class Computer < Player

    WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]

    CORNERS = [0, 2, 8, 6]

    def move(board)
      sleep(1.5)
      position = self.game.avail_moves.sample
      position
    end

    def win_move?
      this_win_comb = WINNING_COMBINATIONS.find do |comb|
        (self.game.board.cells[comb[0]] = self.token && if self.game.board.cells[comb[2]] = self.token  && self.game.board.cells[comb[2]] = "") ||
    end

  end
end
