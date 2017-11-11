class Players
  class Human < Player

    def move(board)
      puts board.display
      input = gets.strip
    end

  end
end
