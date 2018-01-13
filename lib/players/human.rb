module Players
#====================human=====================
  class Human < Player
    def move(board)
      # binding.pry
      board.user_display
      puts "Your Move #{self.token}! (Enter 1-9)".cyan
      gets.strip
    end
  end
#==============================================
end


