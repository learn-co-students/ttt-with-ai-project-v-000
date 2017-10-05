module Players

  class Computer<Player

    def move(board)
      puts "Please enter a number from 1 to 9"#allows a human player to enter a move via the CLI
      gets.strip#returns the move the computer wants to make in the form of a 1-9 string
    end

  end
end
