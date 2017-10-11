module Players
  class Human < Player

    def move(board)
      puts "Please enter where you would like to go: 1-9"
      gets.strip
    end

  end
end
