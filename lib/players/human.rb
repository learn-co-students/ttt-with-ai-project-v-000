module Players
  class Human < Player #inheriting Player functions
    
    def move(board)
      puts "Please enter a number:"
      gets.strip
    end
    
  end
end