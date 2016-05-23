class Player
  class Human < Player
    def move
      puts "Player #{token}, please enter your move (1-9):"
      gets.strip
    end
  end
end

