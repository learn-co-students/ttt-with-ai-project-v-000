module Players
  class Human < Player

    def move(board)
      board.display
      puts "Pick your position - 1-9."
      gets.strip
    end
  end
end
