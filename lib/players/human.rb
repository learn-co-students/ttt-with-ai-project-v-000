module Players

  class Human < Player

    def move(board=[])
      puts "Please enter your move on the grid from 1 to 9!"
      gets.strip
    end
  end

end
