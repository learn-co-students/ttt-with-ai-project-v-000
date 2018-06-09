module Players
  class Human < Player

    def move(board)
      puts "What position do you want to move to?"
      gets.strip;
    end

  end
end
