module Players
  class Human < Player

    def move(input)
      puts "What is your move?"
      response = gets.strip
    end

  end
end
