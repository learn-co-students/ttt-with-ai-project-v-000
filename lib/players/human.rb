module Players

  class Human < Player

    def move(board)
      puts puts "Please select from 1-9"
      input = gets.strip
    end

  end

end
