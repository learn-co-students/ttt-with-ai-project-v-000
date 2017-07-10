module Players
  class Human < Player

    def move(input)
      puts "asks for input"
      input = gets.strip
    end

  end


end
