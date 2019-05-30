require 'pry'

module Players
  class Human < Player
  
    def move(board)
    input = gets.strip  
    while board.taken?(input)
      puts "That spot is taken! Please pick another."
      input = gets.strip
    end
    input
    end
    
  end
end