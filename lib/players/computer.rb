module Players
 class Computer < Player

   def move(board)
    move_array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    move_array.sample
   end

 end #<--CLASSend
end
