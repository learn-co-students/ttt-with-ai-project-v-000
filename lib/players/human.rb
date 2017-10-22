module Players
  class Human < Player

    def move(board)
      puts "Your move #{self.token}!"
      puts "Enter your move as a cell number between 1 and 9"
      pos = gets.strip
    end
  end
end
