module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2], # Top row
      [3,4,5],  # Middle row
      [6,7,8],  # Bottom row
      [0,3,6],  # Left Column
      [1,4,7],  # Middle Column
      [2,5,8],  # Right Column
      [0,4,8],  # Diagnoal L to R
      [2,4,6]  # Diagnoal R to L
    ]

    def move(board)
      i = 0
      board.cells.find do |c|
        if c == " "
          board.cells[i] == self.token
          i += 1
        end

      end
    "#{i + 1}"
    end

  end
end
