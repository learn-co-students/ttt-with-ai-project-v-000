module Players
  class Human < Player

    def move(board)
      puts "Make a move! Enter 1-9:"
      gets.strip
    end
  end
end
