module Players
  class Human < Player
    def move(*)
      puts "Choose between 1-9"
      index = gets.chomp
      index
    end
  end
end
