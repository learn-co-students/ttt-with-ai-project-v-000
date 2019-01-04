module Players
  class Human < Player

    def move(board)
      puts "Where do you want to move?"
      input = gets.strip
    end

  end
end
