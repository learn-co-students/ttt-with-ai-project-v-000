module Players
  class Human < Player
    def move(some_argu)
      puts "Please enter a number between 1 to 9."
      input = gets.strip
    end
  end
end