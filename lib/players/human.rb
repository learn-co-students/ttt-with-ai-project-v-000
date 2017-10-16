module Players

  class Human < Player

    def move(board)
      puts "Please enter a number from 1 to 9"#allows a human player to enter a move via the CLI
      gets.strip
       #method should return the value the user enters
    end

  end

end
