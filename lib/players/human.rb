module Players

  class Human < Player
    def move(board)
      print "Input a number "
      input = gets.chomp
    end
  end

end