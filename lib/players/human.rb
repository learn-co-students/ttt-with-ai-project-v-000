module Players
  class Human < Player
    def move(board)
      puts "Enter the number of an open cell between 1 and 9: "
      gets.strip
    end
  end
end