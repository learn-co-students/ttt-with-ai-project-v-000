module Players
  class Human < Players
    def move(board)
      puts "Enter 1-9:"
      gets.strip
    end
  end
end
