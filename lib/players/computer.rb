require 'pry'
module Players
  class Computer < Player

    def move(board)
      if !board.taken?("5")
        "5"
      elsif corners(board)
        corners(board)
      else
      board.cells.collect.with_index do |v,i|
         (i+1).to_s if v == " "
       end.compact.sample
     end
    end



    def corners(board)
     board.cells.collect.with_index(1){|v, i| i if v == " "}.compact.select do |n|
        n == 1 || n == 3 || n == 7 || n == 9
      end.sample
    end

  end
end
