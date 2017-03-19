module Players
  class Human < Player

    def move(board)
      puts "Where would you like to move?"
      gets.strip
    end

  end
end
