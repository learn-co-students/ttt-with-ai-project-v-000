module Players
  class Human < Player

    def move(board)
      puts "\n#{token}, please enter a valid move for positions 1-9:\n"
      cell = gets.strip
      cell
    end

  end
end
