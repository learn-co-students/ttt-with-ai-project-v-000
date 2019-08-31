module Players

  class Human < Player

    def move(input)
      puts "Please Enter a Number from 1-9: "
      gets.strip
    end

  end
end
