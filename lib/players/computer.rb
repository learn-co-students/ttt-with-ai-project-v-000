
class Computer < Player

  def move(board)

    my_token = self.token
    my_token == "X" ? opponent_token = "O" : opponent_token = "X"

    # generates a random number as a string, "x", such that 1 < x <= 9
    while true
      # puts "the computer is thinking..."
      # sleep(1.0)
      desired_move = (rand(9) + 1).to_s
      return desired_move if board.valid_move?(desired_move)
    end
  end

end


# pseudo algorithm for better AI

# Every move should start by looking for 2 in a row of your opponent and blocking.
#
# move 1: go anywhere
# move 2: try to go in either the same column or same row as your first move (randomly)
#         if you can't do either of those, you can't win that strategy, so go another
#         random place on the board (perhaps the same row or column as your opponent).
# move 3: look for two in a row of your own kind and try to go in the third spot.
# move 4:
