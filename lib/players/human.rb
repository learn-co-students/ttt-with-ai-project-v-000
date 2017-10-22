module Players
  class Human < Player

    def move(board)
      puts "Player #{self.token}'s move:"
      puts "Choose square 1-9 to place your token!"
      gets.chomp
    end

  end
end
