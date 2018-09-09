module Players
  class Human < Player

    def move(input)
      puts "To play, enter a number from 1-9"
      input = gets
      input
    end

  end
end
