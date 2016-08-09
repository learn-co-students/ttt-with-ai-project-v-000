module Players
  class Human < Player

    def move(game)
      puts "What position would you like to occupy?"
      gets.chomp
    end

  end
end