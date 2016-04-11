class Player
  class Human < Player

    def move(argument)
      puts "Please enter your move (1-9):"
      input = gets.strip
      input
    end
    
  end
end