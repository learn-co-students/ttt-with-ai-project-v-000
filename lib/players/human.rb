module Players
  class Human < Player

    def move(board)
      puts "Please enter an integer between 1 and 9."
      input = gets.strip
      input
    end

  end
end
