module Players
  
  class Human < Player
    
    def move(input)
      puts "Enter 1-9:"
      gets.strip
    end
    
  end 
end