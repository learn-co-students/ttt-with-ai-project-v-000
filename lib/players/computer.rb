require 'pry'
module Players
  class Computer < Player
    #@counter = 0
    # @pick_order = ["5","1","3","7","9","2", "4", "6", "8"]
    # @counter = 0
    def move(ary)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      pos = rand(8)
      val = valid_moves[pos]
      valid_moves.delete(val)
      val
      
    #   @counter += 1
    #   @player_array = []
    #   wins = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]
      
    #   @pick_order = ["5","1","3","7","9","2", "4", "6", "8"]
    #   binding.pry
    #   while @counter < pick_order.length
    #     val = @pick_order[@counter]
    #     @counter += 1
    #     val
    #   end
      
      
    #   case @counter
    #   when 1
    #     valid_moves.include?("5")
    #     self.player_array << 5
    #     valid_moves.delete("5")
    #     return val = "5"
    #   when 2
    #     valid_moves.include?("1")
    #     self.player_array << 1
    #     valid_moves.delete("1")
    #     return val = "1"
    #   when 3
    #     valid_moves.include?("3")
    #     self.player_array << 3
    #     valid_moves.delete("3")
    #     return val = "3"
    #   when 4
    #     valid_moves.include?("7")
    #     self.player_array << 7
    #     valid_moves.delete("7")
    #     return val = "7"
    #   when 5
    #     valid_moves.include?("9")
    #     self.player_array << 9
    #     valid_moves.delete("9")
    #     return val = "9"
    #   when valid_moves.include?("2")
    #     self.player_array << 2
    #     valid_moves.delete("2")
    #     return val = "2"
    #   when valid_moves.include?("4")
    #     self.player_array << 4
    #     valid_moves.delete("4")
    #     return val = "4"
    #   when valid_moves.include?("6")
    #     self.player_array << 6
    #     valid_moves.delete("6")
    #     return val = "6"
    #   when valid_moves.include?("8")
    #     self.player_array << 8
    #     valid_moves.delete("8")
    #     return val = "8"
    #   else
    #     return
    #   end
      
      
    #   pos = rand(8)
    #   val = valid_moves[pos]
    #   valid_moves.delete(val)
    #   val
    #   checking best option to win 
      
    #   on turn one try val = 5
    #   if val = 5 is full try val = 1,3,7,9
    #   find all combos that include val
    #   pick any remaining valid_moves = ["2", "4", "6", "8"]
    #   third_pick_list = ["2", "4", "6", "8"]
    #   second_pick_list = ["1","3","7","9"]
    #   first_pick = "5"
      
    #   if valid_moves.include?(first_pick)
    #     val = first_pick
    #     elsif
        
    #   end
      
    #   case valid_moves
    #   when valid_moves.include?("5")
    #     self.player_array << 5
    #     valid_moves.delete("5")
    #     return val = "5"
    #   when valid_moves.include?("1")
    #     self.player_array << 1
    #     valid_moves.delete("1")
    #     return val = "1"
    #   when valid_moves.include?("3")
    #     self.player_array << 3
    #     valid_moves.delete("3")
    #     return val = "3"
    #   when valid_moves.include?("7")
    #     self.player_array << 7
    #     valid_moves.delete("7")
    #     return val = "7"
    #   when valid_moves.include?("9")
    #     self.player_array << 9
    #     valid_moves.delete("9")
    #     return val = "9"
    #   when valid_moves.include?("2")
    #     self.player_array << 2
    #     valid_moves.delete("2")
    #     return val = "2"
    #   when valid_moves.include?("4")
    #     self.player_array << 4
    #     valid_moves.delete("4")
    #     return val = "4"
    #   when valid_moves.include?("6")
    #     self.player_array << 6
    #     valid_moves.delete("6")
    #     return val = "6"
    #   when valid_moves.include?("8")
    #     self.player_array << 8
    #     valid_moves.delete("8")
    #     return val = "8"
    #   else
    #     return
    #   end

    #   count = 0
    #   TracePoint.trace(:call) do |t|
    #     count += 1 if t.method_id == move
    #   end
      
    #   instance.board.cells is the value of the current board
    #   binding.pry
      
      
    # end
    
    # def player_array
    #   @player_array
    end
  end
end