module Players
  class Human < Player
    def move(input)
      puts "make a move between(1-9):"
      user_input = gets.strip
    end
  end
end
