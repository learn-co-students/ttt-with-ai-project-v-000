module Players
  class Human < Player
    # your code here

    def move(board)
      puts "Please enter a number between 1 - 9:"
      gets.strip
    end
  end
end
