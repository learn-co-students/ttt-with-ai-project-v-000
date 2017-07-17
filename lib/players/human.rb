module Players
  class Human < Player
    def move(board)
      puts "Where would you like to go? Enter a number 1-9."
      input = gets.strip
    end
  end
end