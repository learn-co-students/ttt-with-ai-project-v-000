module Players
  class Human < Player

    def move(spot)
      puts "input between 1-9?"
      input=gets.strip
    end


  end
end
