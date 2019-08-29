module Players
  class Human < Player

    def move(board)
      print "Please enter 1-9: "
      user_input = gets.strip
      until board.valid_move?(user_input) do
        print "Invalid move. Please enter 1-9: "
        user_input = gets.strip
      end
      user_input
    end

  end
end
