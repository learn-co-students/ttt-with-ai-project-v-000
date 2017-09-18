module Players
  class Human < Player

    def move(board)
      puts "Pick your position - 1-9."
      gets.strip
    end
  end
end
