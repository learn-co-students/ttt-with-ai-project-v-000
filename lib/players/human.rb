module Players
  class Human < Player

    def move(value)
      puts "Please choose a cell between 1-9"
      choice = gets.chomp
    end
  end
end
