module Players

  class Human < Player

    def move(board)
      puts "Which one?"
      gets.strip
    end

  end
end
