module Players

  class Human < Player

    def move(input)
      puts "Please input a selection."
      input = gets.strip
    end

  end

end
