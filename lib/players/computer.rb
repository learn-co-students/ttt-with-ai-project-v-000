require 'pry'

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

    def move(board)
      if board.turn_count == 0  # Computer's first turn, moves to the center spot
        "5"
      elsif board.turn_count == 3 # Computer's second turn, moves to a corner spot
        corners = [1, 3, 7, 9]
        corners.sample

      # elsif board.turn_count >= 5 # After computer's second turn, moves in the empty spot of a win combination if the win combination has two tokens of the other player
      #   WIN_COMBINATIONS.each do |combination|
      #     position_1 = board.cells[combination[0]]
      #     position_2 = board.cells[combination[1]]
      #     position_3 = board.cells[combination[2]]
      #   end

      else # Moves to a random spot on the board if none of the above are true
      rand(1..9)
      end
    end

  end

end
