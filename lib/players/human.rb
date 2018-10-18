module Players

  class Human < Player

    def move(board)
      puts "Enter a move"
      input = gets.strip
    end

  end

end
