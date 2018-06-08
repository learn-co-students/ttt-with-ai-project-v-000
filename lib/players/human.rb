module Players
  class Human < Player

    def move(board)
      puts "Please enter 1-9:"
      input = gets.strip
      index = input.to_i - 1
      input
    end

  end

end
