module Players

  class Human < Player

    def move(position_number)
      puts "Where would you like to move to? (1-9)"
      position_number = gets.strip
    end

  end

end