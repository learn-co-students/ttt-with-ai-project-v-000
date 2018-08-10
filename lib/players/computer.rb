module Players
  class Computer < Player #Like the Human class, also going to be initialized with a token, either "X" or "O"
    def move(board)
      valid_moves = "1".."9"
      valid_moves.to_a.sample
    #  [board.valid_move?]
      #Returns valid_move? Any number 1-9.
      #move.rand(1..9)
    end
  end
end
