module Players
  class Computer < Player

    # asks the user for input and returns it
    def move(board)
      # input = gets.strip
      # if input = ("1..9")
      board = Board.new()
      if board.valid_move?(input)
      # if input.match(/[1..9]/)
      input
      # else
      #   "invalid"
      end
    end
  end
end
