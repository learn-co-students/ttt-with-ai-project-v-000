module Players
  class Human < Player

    # extend Players::Human

    def move(input)
      puts "Please enter a number from 1-9"
      input = gets.strip
      input
    end

  end
end
