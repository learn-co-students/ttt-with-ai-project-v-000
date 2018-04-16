require 'pry'

module Players
  class Computer < Player

    WIN_COMBINATIONS = [
     ["1","2","3"],
     ["4","5","6"],
     ["7","8","9"],
     ["1","4","7"],
     ["2","5","8"],
     ["3","6","9"],
     ["1","5","9"],
     ["3","5","7"]
     ]

    def move(board)
      corners = ["1", "3", "7", "9"]
      opponents_almost_win = nil

      WIN_COMBINATIONS.each do |win_combination|
        if self.token == "X"
          opponents_positions = win_combination.select {|position| board.position(position) == "O"}
          opponents_almost_win = opponents_positions if opponents_positions.length == 2
        elsif self.token == "O"
          opponents_positions = win_combination.select {|position| board.position(position) == "X"}
          opponents_almost_win = opponents_positions if opponents_positions.length == 2
        end
      end

      saving_move = "0"
      if opponents_almost_win != nil
        WIN_COMBINATIONS.each do |win_combination|
          missing_spaces = win_combination - opponents_almost_win
          missing_space = missing_spaces if missing_spaces.size == 1
          saving_move = missing_space.join if missing_space != nil
        end
      end

      if board.taken?("5") == false
        "5"
      elsif saving_move != "0" && board.valid_move?(saving_move) == true
        saving_move
      elsif corners.any? {|position| board.taken?(position) == false}
        corners.sample
      else
          ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
      end
    end
  end
end
