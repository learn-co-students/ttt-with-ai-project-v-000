module Players
  class Human < Player
  
    def move(board)
      puts "What is your move? (1-9)"
      response = gets.strip
      response
   # binding.pry
    end
  end
end