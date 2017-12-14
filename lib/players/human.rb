module Players
  class Human < Player

    def move(user_input)
      puts "Please select X or O."
      user_input = gets.chomp
    end    
  end
end