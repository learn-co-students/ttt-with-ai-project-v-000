module Players
  class Human < Player

    def move(board)
      puts "Where would you like to move? (1-9)"
      input = gets.strip
      input
    end
  end
end
