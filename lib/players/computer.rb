module Players
  class Computer < Player
    def move(board)
      puts "Please enter 1-9:"
      gets.strip
    end
  end
end