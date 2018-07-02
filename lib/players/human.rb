module Players
  class Human < Player

    def move(input)
      puts "Your turn, Slick"
      gets.chomp
    end
  end
end
