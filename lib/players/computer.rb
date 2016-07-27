module Players
  class Computer < Player

    # asks the user for input and returns it
    def move(board)
      # save input as strings
      input = rand(1..9).to_s
      # move = input
      # if input is valid return input
      if board.valid_move?(input)
         input
       else
         puts "invalid"
      end
      if !board.taken?(1)
        move = "1"
      end
      if board.turn_count == 0
        move = "1"
      end
      # binding.pry
    end

  end
end
