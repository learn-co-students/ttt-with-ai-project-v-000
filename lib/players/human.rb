module Players
  class Human < Player
    
    def move(board = nil)
      puts "Please enter a move ... 1-9"
      gets.strip
    end
    
  end
end