module Players
  class Human < Player
    def move(board)
      puts "Enter a number 1-9"
      input = gets.strip
      return input.to_i - 1
    end
  end
end
