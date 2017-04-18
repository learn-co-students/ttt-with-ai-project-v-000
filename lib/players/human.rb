module Players
  class Human < Player

    def move(pos)
      puts "Player please enter 1-9:"
      input = gets.strip
    end
  end
end
