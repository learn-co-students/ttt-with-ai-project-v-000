module Players

  class Human < Player 
    def move(board)
      puts "Please enter a move."
      gets.chomp
    end
  end
end
