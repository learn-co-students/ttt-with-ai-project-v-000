require 'pry'
module Players
  class Computer < Player
    def move(board)
      
      # valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      # pos = rand(8)
      # val = valid_moves[pos]
      # valid_moves.delete(val)
      # val
      #binding.pry
    #   @counter += 1
    #   @player_array = []
      wins = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]
      
      pick_order = ["5","1","3","7","9","2", "4", "6", "8"]
      second = ["1","3","7","9"]
      third = ["2", "4", "6", "8"]
      
      if board.valid_move?("5")
        return "5"
      elsif second.detect{|i| board.valid_move?(i)} != nil
        firstmatch = second.detect{|i| board.valid_move?(i)}
        second.delete(firstmatch)
        return firstmatch
      elsif third.detect{|i| board.valid_move?(i)} != nil
        lastmatch = third.detect{|i| board.valid_move?(i)}
        third.delete(lastmatch)
        return lastmatch
      end
      
      # while board.full? == false 
      #   firstpick = pick_order.first
      #   if board.valid_move?(firstpick)
      #     pick_order.delete(firstpick)
      #     return firstpick
      #   else 
      #     pick_order.delete(firstpick)
      #   end
      # end
    

    end
    
    
  end
end