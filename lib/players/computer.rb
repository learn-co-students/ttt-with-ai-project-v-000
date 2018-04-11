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
             win_array_check(board)
          else
            num = 1 + rand(9) 
            board.valid_move?(num) ? num.to_s : move(board)
          end
    end
    


    def win_array_check(board)
      WIN_COMBO.find do |combo|
          if board.cells[combo[0]] == board.cells[combo[1]] || board.cells[combo[1]] == board.cells[combo[2]] || board.cells[combo[0]] == board.cells[combo[2]] &&        (board.cells[combo[0]] != ' ' || board.cells[combo[1]] != ' ')
                combo.each do |num|
                binding.pry
                # board.valid_move?(num) ? num.to_s : move(board)
             end
          end
      end
    end  
    
    
  end  
end