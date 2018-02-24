module Players
  class Human < Player

    def move(board = nil)
      board.display
      puts "Your Move #{self.token}! Please choose a valid position from 1-9."
      gets.chomp
    end
  end
end
