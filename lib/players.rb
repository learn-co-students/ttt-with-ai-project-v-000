module Players
#====================human=====================
  class Human < Player
    def move(board)
      board.display
      puts "Your Move #{self.token}! (Enter 1-9)".yellow
      gets.strip
      # returns number
    end
  end
#===================computer===================
  class Computer < Player
    def move(board)
      # puts "==========="
      sleep(0.5)
      puts "AI is thinking...".red
      rand(1..9).to_s
    end
  end
#==============================================
end 



