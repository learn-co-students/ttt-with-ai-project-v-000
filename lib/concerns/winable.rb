module Concerns
  module Winable

    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
    ]

    # check for wining combination
    def won?
      WIN_COMBINATIONS.find do |combo|
        combo.all? {|i| board.cells[i] == "X"} || combo.all? {|i| board.cells[i] == "O"}
      end
    end
  end
end