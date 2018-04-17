module Players

  class Human < Player
    def move(input)
      puts "Please enter your move"
      gets.strip
    end
  end
end
