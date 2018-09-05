module Players
  class Human < Player
    
    def move(board = nil)
      puts "#{self.token}'s turn... Please enter a move ... 1-9"
      gets.strip
    end
    
  end
end