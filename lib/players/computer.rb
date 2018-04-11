module Players
   class Computer < Player
        attr_accessor :combos
        
    WIN_COMBO = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,5,9],
        [3,5,7],
        ]
  
      def move(board)
        num = '5'
        if  board.valid_move?(num)
          board.valid_move?(num) ? num.to_s : move(board)
        elsif
         WIN_COMBO.find do |combo|
            if combo[0] == combo[1] || combo[1] == combo[2] || combo[0] == combo[2] && combo[0] != ' '
                combo.each do |num|
                  board.valid_move?(num) ? num.to_s : move(board)
                end
            end
          end  
        else
          num = 1 + rand(9) 
          board.valid_move?(num) ? num.to_s : move(board)
      end
    end
    
   end  
end