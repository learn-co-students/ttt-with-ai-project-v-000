module Players
  class Human < Player
    def move(board)
      puts "Place move"
      input = gets.strip
    end

  end
end
