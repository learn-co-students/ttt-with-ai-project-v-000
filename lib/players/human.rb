module Players

  class Human < Player

    def move(board)
      puts "Where would you like to move (1-9)?"
      input = gets.chomp
      input
    end

  end

end
