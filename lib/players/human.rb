module Players
  class Human < Player
    def move(board)
      puts "To which grid cell would you like to make a move to?(1-9)"
      gets.chomp
    end
  end
end
