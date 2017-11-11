class Players
  class Human < Player

    def move(board)
      board.display
      input = gets.strip
    end

  end
end
