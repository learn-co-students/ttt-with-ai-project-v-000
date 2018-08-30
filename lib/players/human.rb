module Players
  class Human < Player 
    
    def move(user_input)
      puts "Please enter 1-9:"
      gets.strip
    end
    
  end
end