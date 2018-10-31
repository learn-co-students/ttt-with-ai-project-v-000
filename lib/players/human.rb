require_relative '../../config/environment.rb'

module Players
  class Human < Player 
    def move(user_input)
      user_input = gets.strip  
    end 
  end 
end 