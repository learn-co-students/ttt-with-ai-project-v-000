module Players
  #inherits from Player
 class Human < Player
   #asks the user for input and returns it
    #The human player must implement a #move method that takes in a board argument and allows a human player to enter a move via the CLI.
    #The method should return the value the user enters.
    #Even though the method accepts a board argument, it does not need to use it.
   def move(board)
     #binding.pry
     puts "Your move, #{token}!"
     gets.strip
   end

 end
end
