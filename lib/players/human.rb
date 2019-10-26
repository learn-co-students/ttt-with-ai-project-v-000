module Players

  class Human < Player

    def move (board)
      puts "Please Enter 1 - 9:"
      gets.strip
    end
  end
end
