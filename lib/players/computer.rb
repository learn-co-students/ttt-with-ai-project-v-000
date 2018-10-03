require 'pry'

module Players
  class Computer < Player
    WIN_COMBINATIONS = [
      # Check combos with middle square first, then check others
      [3,4,5], # Middle row
      [0,1,2], # Top row
      [1,4,7], # Middle column
      [6,7,8], # Bottom row
      [0,3,6], # Left column
      [0,4,8], # Diagonal top-left to bottom-right
      [2,4,6], # Diagonal top-right to bottom-left
      [2,5,8] # Right column
    ]
    def move(board)
      if board.cells[4] == " "
        return "5"
      end
      WIN_COMBINATIONS.each do |current_combo|
        position_1 = board.cells[current_combo[0]]
        position_2 = board.cells[current_combo[1]]
        position_3 = board.cells[current_combo[2]]
        current_combo[0] += 1
        current_combo[1] += 1
        current_combo[2] += 1
        if position_1 == "X" && position_2 == "X" && position_3 == " "
          return current_combo[2].to_s
        elsif position_1 == "O" && position_2 == "O" && position_3 == " "
          return current_combo[2].to_s
        elsif position_1 == "O" && position_3 == "O" && position_2 == " "
          return current_combo[1].to_s
        elsif position_1 == "X" && position_3 == "X" && position_2 == " "
          return current_combo[1].to_s
        elsif position_1 == " " && position_2 == "X" && position_3 == "X"
          return current_combo[0].to_s
        elsif position_1 == " " && position_2 == "O" && position_3 == "O"
          return current_combo[0].to_s
        elsif position_1 == " "
          return current_combo[0].to_s
        elsif position_2 == " "
          return current_combo[1].to_s
        elsif position_3 == " "
          return current_combo[2].to_s
        end
      end
    end
  end
end
