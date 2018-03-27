module Players
  class Human < Player

    def move(user_input = nil)
      puts "Give me input!"
      gets.strip
    end
  end
end
