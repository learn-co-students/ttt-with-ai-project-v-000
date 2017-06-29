module Players
  class Human < Player

    def move(board)
      puts "Player #{self.token}, where would you like to move (1-9)?"
      gets.chomp
    end

  end
end
