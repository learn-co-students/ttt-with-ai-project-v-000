module Players

  class Human < Player

    def move(board)
    puts "#{self.token}'s turn. Please input 1-9:"
      gets.strip
    end

  end

end
