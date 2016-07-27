module Players
  class Human < Player
    
    def move(board)
      puts "Please make your move, 1-9:"
        gets.strip
    end
  end
end
