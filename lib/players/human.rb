module Players
  
  class Human < Player
    
    def move(cell)
      puts "Where would you like to move? (1-9)"
      gets.strip
    end
    
  end
  
end