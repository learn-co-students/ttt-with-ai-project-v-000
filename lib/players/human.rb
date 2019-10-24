module Players

  class Human < Player
    def move(board)
      puts "#{self.token}, please pick from 1 - 9."
      gets.strip
    end
  end
end
