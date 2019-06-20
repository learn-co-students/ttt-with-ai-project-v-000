
module Players
  class Human < Player

    def move(user_input)
      puts "Where do you want to go?"
      user_input = gets.strip
    end

  end
end
