class Human < Player
    
    def move(input)
       puts "Where would you like to move?"
       input = gets.strip
    end
end