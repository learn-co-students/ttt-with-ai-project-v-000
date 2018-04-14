module Players

  class Human < Player

    def move(board)
      puts "Please input a number between 1-9"
      input = gets.strip
    end

  end

end
