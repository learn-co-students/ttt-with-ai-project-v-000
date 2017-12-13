require 'pry'
module Players
  class Computer < Player

    def move(board)
      board.cells.collect.with_index do |v,i|
         (i+1).to_s if v == " "
       end.compact.sample
       binding.pry
    end

  end
end
