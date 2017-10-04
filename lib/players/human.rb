module Players
  class Human < Player
    
    def move(input)
      "Please make a move:(enter 1-9)"
      gets.strip
    end
  end
end
