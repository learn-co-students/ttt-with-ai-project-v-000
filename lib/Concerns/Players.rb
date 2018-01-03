module Players

  class Human < Player

    def move(input, board)
      puts "Please enter a space, 1-9"
      gets.input.chomp
    end

  end

end
