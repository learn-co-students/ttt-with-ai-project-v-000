module Players
  class Computer < Player

    # asks the user for input and returns it
    def move(board)
      input = gets.strip
      if board.valid_move?(input)
      input
      else
        nil
      end
    end
  end
end
