module Players
  class Human < Player
    
    def move(token)
      puts "Where would you like to go? (1-9)"
      input = gets.strip
    end

  end


end
