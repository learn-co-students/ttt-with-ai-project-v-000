module Players

  class Human < Player

    def move(board) #why does the test require an argument?  Because computer needs it.
      @board.display
      puts "Greetings, Human.  Please enter your flawed move, 1-9."
      input = gets.strip
    end #move






  end #END HUMAN CLASS

end # END PLAYERS MODULE
