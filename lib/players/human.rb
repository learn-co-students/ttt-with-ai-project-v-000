module Players
  class Human < Player 
    def move(board)
      puts "Where would you like to place your token? (Choose from 1 - 9):"
      gets.strip
    end
  end 
end
