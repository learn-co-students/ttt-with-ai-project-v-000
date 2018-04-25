module Players

  class Human < Player

    def move(board)
      puts "Please input a selection."
      input = gets.strip
    end

  end

end
