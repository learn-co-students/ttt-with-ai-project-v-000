module Players

  class Human < Player

    def move(board)
      print "Enter move (1-9):"
      input = gets.chomp
    end

  end
end
