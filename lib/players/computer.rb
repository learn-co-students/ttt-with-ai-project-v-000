require 'pry'
module Players
  class Computer < Player 
    
  def move(board, game = nil)
    my_answer = (1..9).to_a.sample.to_s 
    
    until board.valid_move?(my_answer)
      my_answer = (1..9).to_a.sample.to_s 
    end 
  my_answer
      end
    end 
end 
    
     