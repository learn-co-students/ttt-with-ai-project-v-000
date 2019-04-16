
module Players
  class Computer < Player
    def move(board)
      puts "Computer player is making a move..."
      sleep(1)
      #returns a valid move (a number between 1 and 9)
      position = rand(1..9)
      position.to_s
    end
  end
end
