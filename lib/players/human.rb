module Players

  class Human < Player

    def move(board = nil)
      puts "Which position would you like to take?"
      input = gets.strip
      input
    end# of move


  end# of class

end# of module
