module Players

  class Human < Player

    def move(board)
      puts "Pick an empty cell, player #{self.token}:"
      input = gets.chomp
      input
    end

  end

end
