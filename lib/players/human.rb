module Players
  class Human < Player

    def move(input)
      puts "Where would you like to move?"
      puts "Please enter a number between 1 and 9."
      user_input = gets.strip
      user_input
    end

  end
end
