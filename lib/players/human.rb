module Players
  class Human < Player
    def move(input)
      puts "What's your move?"
      pmove = gets.strip
    end

  end
end
