module Players

  class Human < Player

    def move(input)
      puts "It's your turn #{token}! What's your move? (Enter a number between 1 and 9)"
      gets.strip
    end

  end

end
