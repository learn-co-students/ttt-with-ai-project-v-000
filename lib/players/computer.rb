module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7]
    ]

    def move(board)

        open_win_combo = WIN_COMBINATIONS.reject{|w| w.all?{|c| board.taken?(c)}}

        priority = open_win_combo.detect{|w| w.select{|c| board.position(c) == self.token}.size == 2}

        priority = open_win_combo.detect{|w| w.select{|c| board.position(c) == self.opponent_token}.size == 2} if !priority

        priority = [5, 1, 3, 7, 9, 2, 4, 6, 8] if !priority

        best_move = priority.reject{|c| board.taken?(c)}
        puts "\nMOVING INTO POSITION - #{best_move[0]}.  YOU WILL NEVER WIN.\n"
        best_move[0]
    end
  end
end
