module Players
  class Human < Player
  
    def move(board)
      puts "Where would you like to move?"
      move = gets.chomp.to_i 
      move
    end
  
  end
end