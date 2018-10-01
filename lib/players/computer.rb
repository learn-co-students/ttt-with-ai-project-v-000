require 'pry'

module Players
  class Computer < Player
    WIN_COMBINATIONS = [
      [0,1,2], # Top row
      [3,4,5], # Middle row
      [6,7,8], # Bottom row
      [0,3,6], # Left column
      [1,4,7], # Middle column
      [2,5,8], # Right column
      [0,4,8], # Diagonal top-left to bottom-right
      [2,4,6] # Diagonal top-right to bottom-left
    ]
    def move(board)
      WIN_COMBINATIONS.each do |current_combo|
        position_1 = board.cells[current_combo[0]]
        position_2 = board.cells[current_combo[1]]
        position_3 = board.cells[current_combo[2]]
        if position_1 == "X" && position_2 == "X"
          return position_3.to_s
        elsif position_1 == "O" && position_2 == "O"
          return position_3.to_s
        elsif position_1 == "X" && position_3 == "X"
          return position_2.to_s
        elsif position_1 == "O" && position_3 == "O"
          return position_2.to_s
        elsif position_3 == "X" && position_2 == "X"
          return position_1.to_s
        elsif position_3 == "O" && position_2 == "O"
          return position_1.to_s
        elsif position_1 == " "
          return position_1.to_s
        elsif position_2 == " "
          return position_2.to_s
        elsif position_3 == " "
          return position_3.to_s
        end
      end
    end
  end
end
