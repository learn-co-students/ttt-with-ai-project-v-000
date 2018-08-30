module Players
  class Human < Player
    def move(board)
      puts "Which position do you want to mark?"
      gets.strip
    end
    
    def awe
    end
  end
end