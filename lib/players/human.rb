module Players
  class Human < Player
    def move(board)
      puts "YOUR TURN, PLAYER #{token}."
      puts "Enter a number between 1 and 9."
      board.display
      gets.strip
    end
  end
end
