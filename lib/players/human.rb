module Players
  class Human < Player

    def move(board)
    puts "Enter a number 1 - 9."
    gets.strip
    end

  end
end
