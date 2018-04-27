require "pry"
module Players
  class Human < Player
    
    def move(input)
      puts "Provide input"
      #binding.pry
      user_input = input
      puts "#{user_input}"
    end
    
  end
  
  
end