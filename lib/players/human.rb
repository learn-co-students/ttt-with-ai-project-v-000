class Player
  class Human < Player
    def move
      puts "Please enter your move (1-9):"
      gets.strip
    end
  end
end

