module Players
  class Human < Player
    def move(board)
      puts "#{self.token}'s turn.\nWhere do you want to move? (1-9)"
      gets.chomp
    end
  end
end
