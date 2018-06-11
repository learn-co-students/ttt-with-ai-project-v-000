module Players
  class Human < Player

    def move(board)
      puts "Please enter 1-9:"
      input = gets.strip
      until %w(1 2 3 4 5 6 7 8 9).include?(input)
        puts "Sorry, that's an invalid entry."
        puts "Please enter 1-9:"
        input = gets.strip
      end
      input
    end

  end
end
