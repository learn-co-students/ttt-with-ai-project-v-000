module Players
  class Human < Player
    # move method
    def move(board)
      puts "Please make a move by entering a number from 1 - 9."
      input = gets.chomp
    end
  end
end
