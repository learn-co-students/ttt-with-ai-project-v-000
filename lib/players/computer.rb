require 'pry'

module Players
  class Computer < Player
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]

    def move(board)
      

      corners = [1,3,7,9]
      center = 5
      choice = ""

      # if first player, first turn, take a corner
      if board.turn_count == 0
        choice = corners.sample
      elsif board.turn_count == 1
        if corners.any? {|cell| board.taken?(cell)}
          choice = center
        else
          choice = corners.sample
        end
      else

        # if it's possible to win, do so
        WIN_COMBINATIONS.each do |win_combo|
          # analyze the state of the combo
          combo_state = [board.cells[win_combo[0]], board.cells[win_combo[1]], board.cells[win_combo[2]]]
          tokens = combo_state.find_all {|cell| cell == self.token}
          blanks = combo_state.find_all {|cell| cell == " "}
          if tokens.size == 2 && blanks.size == 1
            choice = win_combo[combo_state.find_index(" ")] + 1
            puts choice
            return choice.to_s
          end
        end

        # instead, if the opposit player needs to be blocked, do so
        WIN_COMBINATIONS.each do |win_combo|
          # analyze the state of the combo
          combo_state = [board.cells[win_combo[0]], board.cells[win_combo[1]], board.cells[win_combo[2]]]
          tokens = combo_state.find_all {|cell| cell == self.token}
          blanks = combo_state.find_all {|cell| cell == " "}
          if tokens.size == 0 && blanks.size == 1
            choice = win_combo[combo_state.find_index(" ")] + 1
            puts choice
            return choice.to_s
          end
        end

        # if not, just further your own agenda...
        WIN_COMBINATIONS.each do |win_combo|
          # analyze the state of the combo
          combo_state = [board.cells[win_combo[0]], board.cells[win_combo[1]], board.cells[win_combo[2]]]
          tokens = combo_state.find_all {|cell| cell == self.token}
          blanks = combo_state.find_all {|cell| cell == " "}
          if tokens.size == 1 && blanks.size >= 1
            choice = win_combo[combo_state.find_index(" ")] + 1
            puts choice
            return choice.to_s
          end
        end

        # or select a random space!
        possible_moves = (1..9).select do |cell|
          board.cells[cell - 1] == " "
        end
        choice = possible_moves[Random.rand(possible_moves.size)].to_s
      end

      puts choice
      choice.to_s

    end
  end
end