module Players
  class Human < Player

    def move(board)
      puts "Where would you like to make your move(1-9)?"
      gets.strip
    end
  end
end
