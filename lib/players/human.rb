
module Players
  class Human < Player

    def move(board)
      # Even though the method accepts a `board` argument,
      # it does not need to use it.
      puts "Enter a number from 1-9:"
      input = gets.strip
    end

  end
end
