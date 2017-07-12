module Players
  class Human < Player

    def move(token)
      puts "asks for input"
      input = gets.strip
    end

  end


end
