module Players
  class Human < Player
    
    def move(board)
      puts "Input 1-9"
      input = gets.chomp 
    end
  end
end