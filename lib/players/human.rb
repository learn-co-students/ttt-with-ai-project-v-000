module Players
#====================human=====================
  class Human < Player
    def move(board)
      board.display
      puts "Your Move #{self.token}! (Enter 1-9)".yellow
      gets.strip
    end
  end
#==============================================
end
