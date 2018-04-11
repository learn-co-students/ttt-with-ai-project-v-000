module Players
   class Computer < Player      
  
      def move(board)
        num = 1 + rand(9) 
        board.valid_move?(num) ? num.to_s : move(board)
      end
    
    
   end  
end