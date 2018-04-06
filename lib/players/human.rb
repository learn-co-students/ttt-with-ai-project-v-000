module Players

  class Human < Player

    def move(human_player)
      puts "Please make a move."
      input = gets.strip
      input
    end

  end

end
