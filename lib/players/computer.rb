module Players
  class Computer < Player
    attr_accessor :board
    
@valid_moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    
def move(board)
  turns = board.turn_count
  if self.token == "X"
    if turns == 0
      return "5"
    elsif turns == 2
      if !@board.taken?("4")
        return "4"
      else 
        return "9"
      end 
    elsif turns == 4
          if !@board.taken?("1")
            return "1"
            elsif !@board.taken?("3")
            return "3"
        end 
    elsif turns == 6 || turns == 8
              return @valid_moves.sample
        end
            
    elsif self.token == "O"
            if turns == 1
            if !@board.taken?("5")
              return "5"
            else
              return "9"
            end
              elsif turns == 3
              if !@board.taken?("1")
                return "1"
              else 
                return "7"
              end 
              elsif turns >= 5
              return @valid_moves.sample
          end 
      end 
  end 
  
end 
              
            
            
  
  
  
  
  
  #while board.turn_count == 0 || board.turn_count == 1
  #if board.taken?("5") == false
    #@valid_moves.delete(5)
    #return "5"
  #elsif 
    #board.taken?("1") == false
    #@valid_moves.delete(1)
    #return "1"
  #elsif board.taken?("3") == false
  #@valid_moves.delete(3)
    #return "3"
  #elsif board.taken?("7") == false
  #@valid_moves.delete(7)
  #return "7"
  #elsif board.taken?("9") == false
  #@valid_moves.delete(9)
  #return "9"
#else 
#while board.turn_count >= 2
#rando = @values.sample
#return rando.to_s
#end 
#end
#end 
#end 
#end
#end 


    
end     