require 'pry'
class Players
  class Computer <  Player 
    def move(board)
      # binding.pry
      Game.win_combo.map do |combo|
        if board.position(combo[0]) == board.position(combo[1]) && board.position(combo[1]) != " "  && board.position(combo[1]) != nil
             return combo[2] 
        elsif board.position(combo[2]) == board.position(combo[1]) && board.position(combo[1]) != " " && board.position(combo[1]) != nil
          return combo[0] 
        elsif board.position(combo[2]) == board.position(combo[0]) && board.position(combo[1]) != " " && board.position(combo[1]) != nil
          return combo[1] 
      end
      
     end
     input = rand(8).to_s 
      
    end
    
  end
end


