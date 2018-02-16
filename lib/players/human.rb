module Players

  class Human < Player
    def move(board)
      puts "Enter a move:"
      input = gets.chomp
    end
  end
  
end