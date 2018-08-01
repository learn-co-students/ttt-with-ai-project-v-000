class Players
  class Computer < Player

    ALMOST_WIN = [
      [0, 1], [3, 4], [6, 7], [1, 2], [4, 5], [7, 8],
      [0, 3], [1, 4], [2, 5], [6, 3], [7, 4], [8, 5],
      [0, 4], [6, 4], [0, 8], [8, 4], [2, 4], [6, 2]
    ]

    def move(board)
      defense(board) || offense(board)
    end

    private

    def defense(board)
      ALMOST_WIN.detect do |combo|
        if @board.taken?(combo[0]+1) && @board.taken?(combo[1]+1)
          game.WIN_COMBINATIONS.detect do |win_combo|
            win_combo.sort && combo.sort
            if win_combo[0] == combo[0] && win_combo[1] == combo[1]
              defense = win_combo - combo
              defense.join
            end
          end
        end
      end
    end

    def offense(board)
      '5' unless board.taken?(5)
      '1' unless board.taken?(1)
      '3' unless board.taken?(1)
      '7' unless board.taken?(1)
      '9' unless board.taken?(1)
      computer_move = [1, 3, 5, 7].shuffle
      computer_move[0].to_s unless board.taken?(computer_move[0]+1)
    end
  end
end
