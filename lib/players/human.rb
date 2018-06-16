module Players
  class Human < Player

    def move(board)
      puts "Hi! Welcome to the wonderful world of Tic-Tac-Toe."
      puts "Please enter your first move so we can start the game."
      input = gets.chomp
    end

  end
end
