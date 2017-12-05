module Players
  class Human < Player

    def move(input)
      puts "Please choose a position between (1,9):"
      input = gets.strip
    end
  end
end
