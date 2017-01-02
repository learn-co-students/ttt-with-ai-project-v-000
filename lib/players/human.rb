module Players
  class Human < Player
    def move(board)
      puts "Where would you like to make your move? Enter a valid number from 1 to 9."
      gets.chomp
    end
  end
end
