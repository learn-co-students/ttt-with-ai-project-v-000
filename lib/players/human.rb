module Players

  class Human < Player
    def move(token)
      print "Input a number "
      input = gets.chomp
    end
  end

end