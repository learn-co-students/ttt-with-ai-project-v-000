module Players
  class Human < Player
    def move(a)
      puts "Please enter your position on the board:"
      a = gets.strip
    end

  end
end
