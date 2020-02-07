module Players
  class Human < Player

    def move(board)
      puts "It's #{self.name}'s turn!"
      puts "Please enter in a number from 1-9:"
      pos = gets
      pos.strip
    end

  end
end
