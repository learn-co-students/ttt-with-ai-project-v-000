module Players
  class Human < Player

    def move(input)
      puts "Hey! It's your turn. Enter a number 1-9."
      response = gets.to_s
    end

  end
end
