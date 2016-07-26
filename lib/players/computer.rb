module Players
  class Computer < Player

    # asks the user for input and returns it
    def move(board)
      # save input as strings
      input = rand(1..9).to_s
      # if input is valid return input
      if board.valid_move?(input)
         input
       else
         puts "invalid"
      end
    end
    
  end
end
