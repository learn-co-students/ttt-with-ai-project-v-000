module Players
   class Computer < Player
        attr_accessor :combos
        
 WIN_COMBO = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
        
      def move(board)
        num = '5'
          if  board.valid_move?(num)
            board.valid_move?(num) ? num.to_s : move(board)
          elsif win_array_check(board)
          
            win_array_check(board).each do |num|
              binding.pry
              board.valid_move?(num) ? num.to_s : move(board)
            end
          else
            num = 1 + rand(9) 
            board.valid_move?(num) ? (num-1).to_s : move(board)
          end
    end
    


    def win_array_check(board)
     WIN_COMBO.find do |combo|
        #binding.pry
        (board.cells[combo[0]] == board.cells[combo[1]] || board.cells[combo[1]] == board.cells[combo[2]] || board.cells[combo[0]] == board.cells[combo[2]]) && ([board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]].select { |a| a == " "}.length == 1)
            
      end
   
    end  
    
    
  end  
end