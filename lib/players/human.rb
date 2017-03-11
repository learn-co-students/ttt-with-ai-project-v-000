module Players

  class Human < Player

    def move(board)
      puts "Enter 1-9 to choose location"
      input = gets.chomp
      input
    end

  end

end
