module Players
  class Computer < Player
    def move(board)
      if board.cells[4] == " "
        "5"
      else
        "1"
      end
    end
  end
end

# AI Logic Ideas
# - When the computer is "X" -
# 1. First turn, try the middle space. If middle is taken, try a corner space
# 2. Each turn, If X (you) has two in the winning combos and it is your turn, choose the 3rd in the combo
# 3. Then, check to see if O has two in the winning combos (including in the corners), and if yes, choose the 3rd in the combo
# 4. Otherwise, choose a spot next to another one of your tokens (x)

# WIN_COMBINATIONS = [
#  [0, 1, 2], --> [0, 1] or [1, 2] or [0, 2]
#  [3, 4, 5], --> [3, 4] or [4, 5] or [3, 5]
#  [6, 7, 8], --> [6, 7] or [7, 8] or [6, 8]
#  [0, 3, 6], --> [0, 3] or [3, 6] or [0, 6]
#  [1, 4, 7], --> [1, 4] or [4, 7] or [1, 7]
#  [2, 5, 8], --> [2, 5] or [5, 8] or [2, 8]
#  [0, 4, 8], --> [0, 4] or [4, 8] or [0, 8]
#  [6, 4, 2] --> [6, 4] or [4, 2] or [6, 2]
#]
