module Players
  class Human < Player

    def move(board)#ask for the choice/grid location the player wants
      puts "Player #{self.token}, it's your turn. Please enter 1-9:"
      gets.strip
    end
  end
end
