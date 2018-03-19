module Players
  class Human < Player
    def move(board)
      board.display
      puts "Please make a valid move between 1-9."
      gets.strip
    end
  end
end