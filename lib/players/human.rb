module Players
   class Human < Player

     #implement move method that takes in a board argument
     #allows human player to enter a move via the Congratulations
     #return the value the user enters

     def move(board)
       puts "Please enter 1-9:"
       position = gets.strip
       position
     end

   end
 end
