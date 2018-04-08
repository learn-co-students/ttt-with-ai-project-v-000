module Players

  class Human < Player

    def move(board)
      puts "Please make a move."
      input = gets.strip
      input
    end

  end

end
