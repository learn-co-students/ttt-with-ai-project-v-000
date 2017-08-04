module Players
  class Human < Player

    def move(board)
      puts "Choose 1-9"
      gets.strip
    end
  end
end
