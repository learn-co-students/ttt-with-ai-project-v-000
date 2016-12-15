module Players

  class Human < Player

    def move(input)
      puts "Please enter a cell 1-9"
      input = gets.strip
    end
  end
end
