module Players
  class Human < Player
    def move(input)
      puts "Enter your move:"
      input = gets
    end
  end
end
