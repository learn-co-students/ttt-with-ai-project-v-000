module Players

  class Human < Player

    def move(board = nil)
      puts "\nIt is #{self.token}'s turn.  Which position will #{self.token} take?"
      input = gets.strip
      input
    end# of move


  end# of class

end# of module
