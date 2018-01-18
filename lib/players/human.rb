module Players

  class Human < Player

    def move(board)
      puts "#{self.name} Please enter and input"
      input = gets.chomp
    end

  end



end
