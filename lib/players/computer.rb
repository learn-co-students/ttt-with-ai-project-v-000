module Players
 class Computer < Player

   def move(board)
    move_array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    move_array.sample
    # chooses a random number - ****but creates invalid space choices - spaces that are already taken -
    # PLZ: FIX : check to see if sampled space is taken or not- if it is taken - try sample again until valid space is sampled
   end

 end #<--CLASSend
end
