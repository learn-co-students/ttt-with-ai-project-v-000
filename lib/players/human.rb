module Players
  class Human < Player
    def move(board)
      puts ""
      puts "Please enter a valid move: 1-9"
      gets.strip
    end
  end

  class Computer < Player
  end
end
