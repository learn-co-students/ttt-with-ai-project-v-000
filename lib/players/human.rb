module Players
  class Human < Player
    def move(input)
      input = gets.chomp
    end
  end
end
