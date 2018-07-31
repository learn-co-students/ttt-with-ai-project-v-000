module Players
  class Human < Player
  
    def move(board)
      puts "Please enter your a number between 1 and 9: "  
      user_move = gets.chomp 
      user_move
    end
  end
end 