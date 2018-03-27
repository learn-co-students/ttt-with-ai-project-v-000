module Players
  class Human < Player

    def move(user_input = nil)
      puts ""
      puts "Where would you like to go? Pick an empty space between 1 and 9"
      2.times {puts ""}
      gets.strip
    end
  end
end
