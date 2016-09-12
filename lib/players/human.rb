module Players
  class Human < Player
    def move(board)
      puts "Please enter a position: "
      gets.strip
    end
  end
end
