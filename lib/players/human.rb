module Players
  
  class Human < Player

    def move(board)
      puts "Please enter your next move."
      input = gets.strip
    end
  end
end
