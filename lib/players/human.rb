module Players
  class Human < Player
    def move(token)
      puts "Where would like to move?"
      inp = gets.chomp
      inp
    end
  end
end
