module Players
  class Human < Player
    def move(input)
      puts "What is your next move?"
      input = gets.chomp
    end
  end
end
