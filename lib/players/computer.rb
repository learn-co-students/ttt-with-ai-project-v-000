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
        elsif !board.valid_move?(input)
         puts "invalid"
        elsif !board.taken?(1)
          move = "1"
        elsif board.turn_count == 3
          move = "6"
      end
      # binding.pry
    end

  end
end
