module Players
  class Human < Player
    def move(input)
      puts "Please enter a number 1-9: "
      input=gets.chomp
    end
  end
end
