module Players
  class Human < Player
    
    def move(board)
      puts "Please enter your move:"
      input = gets.strip
    end
  end
end
