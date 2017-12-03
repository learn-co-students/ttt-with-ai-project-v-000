module Players

  class Human < Player

    def move(board) #why does the test have an argument?  Because computer needs it.
      puts "Greetings, Human.  Please enter your flawed move, 1-9."
      input = gets.strip
    end #move






  end #END HUMAN CLASS

end # END PLAYERS MODULE
