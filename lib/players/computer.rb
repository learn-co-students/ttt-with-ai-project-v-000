require_relative '../player.rb'
require 'pry'
module Players
class Computer < Player
  
  def move(board)
    sleep(1)
    rando1 = rand(9)
    rando2 = rand(9)
    move = nil
    if !board.taken?(5)
      move = "5"
    
    elsif board.turn_count == 2 || board.turn_count >5
      move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
  
    elsif !board.taken?(rando1) && board.turn_count.odd?
      move = rando1.to_s
      
    elsif !board.taken?(rando2) && board.turn_count.even?
      move = rando2.to_s 
    
    elsif board.cells.each.with_index {|cell,index| 
          if !board.taken?(index+1) 
            move = "#{index+1}"
          end }
        move
    end

end
end
end