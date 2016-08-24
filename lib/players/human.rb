module Players
  class Human < Player
    def move(board)
      puts "Where would like to move?"
      inp = gets.chomp
      inp
    end
  end
end
