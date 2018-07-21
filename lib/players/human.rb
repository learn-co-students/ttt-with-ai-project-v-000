module Players
  class Human < Player

    def move(board)
      puts "Where to?"
      input = gets.chomp
    end
  end
end
