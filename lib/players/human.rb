module Players
  class Human < Player

    def move(board)
      board.display
      puts "Please choose 1-9:"
      input = gets.strip
      return input
    end


  end
end
