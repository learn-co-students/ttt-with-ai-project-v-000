
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
      if self.win_move_available?
        binding.pry
        self.win_move
      else
        position = self.game.avail_moves.sample
        position
      end
    end

    def win_move_available?
      WIN_COMBINATIONS.find do |combination|
        (self.game.board.cells[combination[0]] == self.token && self.game.board.cells[combination[1]] == self.token &&    self.game.board.cells[combination[2]] == " ") || (self.game.board.cells[combination[0]] == self.token &&     self.game.board.cells[combination[2]] == self.token && self.game.board.cells[combination[1]] == " ") ||    (self.game.board.cells[combination[1]] == self.token && self.game.board.cells[combination[2]] == self.token &&    self.game.board.cells[combination[0]] == " ")
        binding.pry
      end
    end

    def win_move
      winning_combination = WIN_COMBINATIONS.find do |combination|
        (self.game.board.cells[combination[0]] == self.token && self.game.board.cells[combination[1]] == self.token &&    self.game.board.cells[combination[2]] == " ") || (self.game.board.cells[combination[0]] == self.token &&     self.game.board.cells[combination[2]] == self.token && self.game.board.cells[combination[1]] == " ") ||    (self.game.board.cells[combination[1]] == self.token && self.game.board.cells[combination[2]] == self.token &&    self.game.board.cells[combination[0]] == " ")
      end
      winning_combination.find do |position|
        position == " "
      end
    end

  end
end
