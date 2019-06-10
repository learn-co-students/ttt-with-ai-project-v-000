module Players
  
 class Computer < Player 
   
   def move(board)
     array = []
     i = 1 
     while i < 10
   if  board.valid_move?(i)
        position = i.to_s 
        array << position
   end 
   i +=1 
 end 
  position 
   end 
 end 
 
end 