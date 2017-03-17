module Players
  class Human < Player

    def move(variable)
      puts "What space would you like to move into?"
      input = gets.strip
    end

  end
end
