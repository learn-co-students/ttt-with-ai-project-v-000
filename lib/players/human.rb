module Players
  class Human < Player

    def move(board)
      puts "Your turn, Slick"
      gets.strip
    end
  end
end
