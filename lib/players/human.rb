module Players

  class Human < Player

    def move(input) #why does the test have an argument?
      "Greetings, Human.  Please enter your flawed move, 1-9."
      input = gets.strip
      input
    end #move






  end #END HUMAN CLASS

end # END PLAYERS MODULE
