module Players
  class Human < Player

    def move(board)
      board.display
      puts "Player #{self.token}, please enter a number (1-9):"
      user_input = gets.chomp
    end
  end
end