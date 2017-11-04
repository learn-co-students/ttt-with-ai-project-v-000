module Players
  class Players::Human < Player

    def move(input)
      puts "Hey human! It's your turn"
      response = gets.to_s
    end

  end
end
