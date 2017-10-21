module Players
  class Computer < Player

    # asks the user for input and returns it
    def move(board)
      # save input as strings
      input = rand(1..9).to_s
      if board.valid_move?(input)
        input
        elsif board.valid_move?(input)
         puts "invalid"
        elsif board.taken?(1) && board.taken?(2)
          move = "3"
        elsif board.taken?(4) && board.taken?(5)
          move = "6"
        elsif board.taken?(7) && board.taken?(8)
          move = "9"
        elsif board.taken?(4) && board.taken?(5)
          move = "5"
      end
    end

  end
end
