module Players
  class Computer < Player
    attr_accessor :board

    WIN_COMBINATIONS = [
    [0, 1, 2],
    [0, 3, 6],
    [0, 4, 8],
    [1, 4, 7],
    [2, 4, 6],
    [2, 5, 8],
    [3, 4, 5],
    [6, 7, 8]
    ]
    CORNERS = [0, 2, 6, 8]

    def move(board)
      "1"
    end
  end

  def win_moves
    #define win for the computer
  end

  def corners
    #define corner moves
  end

  def block

  end

  def tie

  end

  def center_move

  end
end

#Adjust the computer move method to include valid computer move.
#Adjust the turn method to accommodate the computer's turn without requesting input from the user.
#Find a way to randomize the computer moves
#Write the win, block, tie, corner and center moves for the computer
