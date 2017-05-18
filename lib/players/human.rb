module Players
  class Human < Player

    def move(position)
      puts "Please make a move (1-9)"
      position = gets.strip
    end

  end
end
