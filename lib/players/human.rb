module Players
  class Human < Player


    def move(board)
      puts "Player #{self.token}, where would you like to move?"
      move = gets.strip
    end
  end
end
  
