require "pry"
module Players
  class Computer < Player 
    
    def move(board)
      if board.turn_count == 0
         5.to_s
      elsif board.turn_count == 1 
        if board.valid_move?(5)
           5.to_s
         else 
           [1,3,7,9].sample.to_s
         end
       elsif board.cells.count == 3 
        if board.taken?("1")
          9.to_s 
        elsif board.taken?("9")
          1.to_s
        elsif board.taken?("3")
          7.to_s
        elsif board.taken?("7")
          3.to_s
        else 
          [1,3,7,9].sample.to_s
        end 
       elsif !board.taken?("1") || !board.taken?("9") || !board.taken?("7") || !board.taken?("3")
           [1,3,7,9].sample.to_s
      else 
           rand(1..9).to_s
         end
    end
   
  
  
end
end