class Players
  class Human < Player

    def move(board)
      board.display
      puts "Make a move"
      input = gets.strip
    end

  end
end
