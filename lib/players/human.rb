module Players
  class Human < Player

    def move(board)
      puts "Player #{self.token}, please enter a number between 1 and 9:"
      gets.strip
    end
  end
end
