module Players
  class Human < Player
  

    def move(user_input)
      puts "Please enter your selection from 1 to 9."
      user_input = gets.strip
    end

  end

end
