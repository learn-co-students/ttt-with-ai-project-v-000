module Players
  class Human < Player

    def move(board)
      puts "Please enter your selection (1-9)"

      # board[input.to_i - 1] = token
        input =gets.strip
    end

  end
end
