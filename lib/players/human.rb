module Players
  class Human < Player
    def move
      puts "Please enter 1-9:"
      user_input = gets.strip
    end
  end
end
