module Players
#====================human=====================
  class Human < Player
    def move(board)
      puts "Please enter 1-9"
      gets.strip
      # returns number
    end
  end
#===================computer===================
  class Computer < Player
    def move(board) 
      rand(1..9).to_s
    end
  end
#==============================================
end 



