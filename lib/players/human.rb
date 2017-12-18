module Players
   class Human < Player

   def move(board)
     puts "please enter a number from 1-9"
     board.display
     gets.strip
   end
  end

end
