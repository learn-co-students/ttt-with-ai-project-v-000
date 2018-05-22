module Players
  class Computer < Player

    def move(board)
      rand(1..9)
    end
  end
end

#Adjust the computer move method to include valid computer move.
#Adjust the turn method to accommodate the computer's turn without requesting input from the user.
#Find a way to randomize the computer moves
#Write the win, block, tie, corner and center moves for the computer
