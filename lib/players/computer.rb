module  Players

  class Computer < Player

    def move(board)

      # GAME START
      if !board.taken?(5)
        move = "5"

      elsif
        move = "1" || "3" || "7" || "9"

      elsif board.turn_count == 2 # Assumes AI occupied the center cell in first move
        move = [1, 3, 7, 9].detect{|t| !board.taken?(t)}.to_s
      end

    end

  end

end

################## AI PLAY LOGIC ##################

# Using if/else/elsif statements:

##### AI's FIRST MOVE #####
# 1) if AI plays first, then move to center cell [4].
# 2) elsif AI plays second, and the center cell is taken, then move to upper-left corner cell [0].
# 3) elsif AI plays second, and the center cell is not taken, then move to center cell.

##### AI's SECOND MOVE #####
# 4) elsif AI plays third and occupied the center cell in its first move, then move to a corner cell that is not taken [0,2,6,8].

##### AI's THIRD MOVE #####
# 5) Scan the board for a combination of the opposing player's token and move to block.

##### OTHER NOTES #####
# There can be something like a #block method where the AI scans the board and would strategically move
# to the adjacent cell if it finds 2 cells containing the same token. Ex: if cells [0] and [1] are occupied
# by the same token, then the AI would move to cell [2].

# The AI should also know its token because it will need to scan the board for 2 of its same tokens and then move to a third adjacent cell to win.
