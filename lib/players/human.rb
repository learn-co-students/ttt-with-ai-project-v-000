module Players
  class Human < Player
    def move(board)
      puts "Enter position to play: "
      input = gets.strip
    end
  end
end
