module Players
  class Human < Player

    def move(board = nil)
      puts "Player #{self.token}. Please enter 1-9:"
      user_input = gets.strip
    end
  end
end
