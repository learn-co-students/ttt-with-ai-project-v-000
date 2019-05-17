module Players
  class Human < Player

    def move(input)
      puts "Please place your token on any space between 1 and 9:"
      gets.strip
    end
  end
end
