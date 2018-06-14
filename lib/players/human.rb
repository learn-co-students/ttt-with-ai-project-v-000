module Players
  class Human < Player

    def move(board)
      puts "Enter 1-9"
      gets.strip
    end

  end
end
