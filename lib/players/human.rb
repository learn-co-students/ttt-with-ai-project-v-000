module Players
  
  class Human < Player
  
    def move(board)
      #represents how this type of player makes a TTT move
      #takes board argument and allows a human player to enter a move via the CLI -- and returns the value the user enters
      
      puts "Please enter 1-9:"
      gets.strip
      
        #  Test if gets a number between 1 and 1-9 or "exit" to exit the game
        #    obj = obj.to_s unless obj.is_a? String
        #    /\A[+-]?\d+(\.[\d]+)?\z/.match(obj)
      
        #      if gets == "exit"
        #        game.draw?
        #      end
    end
  end
end
