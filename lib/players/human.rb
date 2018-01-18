module Players
  class Human < Player
    def move(board)
      puts "Please enter 1-9 to move:"
      current_move = gets.strip
      if current_move == "exit"
        puts "Thanks for playing!"
        exit
      else
        current_move
      end
      current_move
    end

  end

end
