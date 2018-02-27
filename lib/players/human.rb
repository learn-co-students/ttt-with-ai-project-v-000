module Players
  class Human < Player

    def move(board = nil)
      if board.turn_count == 0
        board.display
      end
      puts "Your Move #{self.token}! Please choose a valid position from 1-9.".cyan
      gets.chomp
    end
  end
end
