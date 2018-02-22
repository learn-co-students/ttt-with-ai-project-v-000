# humans.rb
#
# Defines the Human class, a subclass of the Player class.A
#


module Players

  class Human < Player

    def move(board)
      puts "\nIt's #{self.token}'s move!"
      puts "\nPlease enter your move:"
      move = gets.chomp
      move
    end



  end

end


