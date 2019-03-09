module Players
  class Computer < Player 
    def move(board)
      puts "Where would you like to move?"
      position = "#{rand(1..9)}"
    end 
  end 
end 