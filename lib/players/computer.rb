require 'pry'
# Players::Computer inherits from Player
# Players::Computer #move returns a valid position for the computer to move
#  positions:  |   cell array:
#  1 | 2 | 3   |   0 | 1 | 2
# -----------  |
#  4 | 5 | 6   |   3 | 4 | 5
# -----------  |
#  7 | 8 | 9   |   6 | 7 | 8

module Players
  class Computer < Player
    # attr_accessor :board, :game, :cells

    def move(board)
        # middle if possible
        # binding.pry
        move = nil
        if board.cells[5] == " " then move = 6
        end

        # upper left corner:
        if board.cells[0] == board.cells[1] && board.cells[0] != " "
          move = 3 # 0, 1 & 2(3) horizontal
        elsif board.cells[0] == board.cells[2] && board.cells[0] != " "
          move = 2 # 0, 2 & 1(2) horizontal
        elsif board.cells[0] == board.cells[4] && board.cells[0] != " "
          move = 9 # 0, 4 & 8(9) diagonal
        elsif board.cells[0] == board.cells[3] && board.cells[0] != " "
          move = 7 # 0, 3 & 6(7) vertical
        elsif board.cells[0] == board.cells[8] && board.cells[0] != " "
          move = 5 # 0, 8 & 4(5) diagonal
        elsif board.cells[0] == board.cells[6] && board.cells[0] != " "
          move = 4 # 0, 6 & 3(4) vertical
      # middle horizontal
        elsif board.cells[2] == board.cells[4] && board.cells[2] != " "
          move = 7 # 2, 4 & 6(7) diagonal
        elsif board.cells[2] == board.cells[6] && board.cells[2] != " "
          move = 5 # 2, 6 & 4(5) diagonal
        elsif board.cells[2] == board.cells[5] && board.cells[2] != " "
          move = 9 # 2, 5 & 8(9) vertical
        elsif board.cells[2] == board.cells[8] && board.cells[2] != " "
          move = 6 # 2, 8 & 5(6) vertical
      #lower horizontal
        elsif board.cells[6] == board.cells[7] && board.cells[6] != " "
          move = 9 # 6, 7 & 8(9) horizontal
        elsif board.cells[6] == board.cells[8] && board.cells[6] != " "
          move = 8 # 6, 8 & 7(8) horizontal
        elsif board.cells[3] == board.cells[4] && board.cells[3] != " "
          move = 6 # 3, 4 & 5(6) horizontal
        elsif board.cells[4] == board.cells[5] && board.cells[3] != " "
          move = 5 # 3, 5 & 4(5) horizontal
        else move = rand(1...9)
        end
        if board.valid_move?(move)
          move.to_s
        else move(board)
        end
    end
  end
end
