require 'pry'

class Players
  class Computer < Player
    attr_accessor  :board
    
    
    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]
    
    CORNERS = [0,2,6,8]
    SIDES = [1,3,5,7]
    
    def move(board)
      @board = board
      if can_i_win?
       can_i_win?
      elsif center?
        center?
      elsif corner?
       (corner?+1).to_s
      else
      (side?+1).to_s
      end
    end 
    
    # Iterate through the WIN_COMBINATIONS to find where two of the three spots are taken by the same token as the player.
    
    def can_i_win?
      win_combo = WIN_COMBINATIONS.detect do |c|
      (@board.cells[c[0]] == self.token && @board.cells[c[1]] == self.token && @board.cells[c[2]] == " ") ||
      (@board.cells[c[0]] == self.token && @board.cells[c[2]] == self.token && @board.cells[c[1]] == " ") ||
      (@board.cells[c[1]] == self.token && @board.cells[c[2]] == self.token && @board.cells[c[0]] == " ")
      end 
      if win_combo != nil 
        win_move = win_combo.detect{|a| @board.cells[a] == " "}
          (win_move + 1).to_s
      else 
        nil
      end
    end 
    
    #Need a method to do the opposite of can_i_win? to stop other player from winning.
  
    
    #If nobody will win on next move take the center
    
    def center?
      if @board.cells[4] == " "
        "5"
      else 
        nil
      end 
    end 
    
    #If the center is already taken try a corner
    
    def corner?
      CORNERS.detect{|a| @board.cells[a] == " "}
    end  
    
    # If the corners are taken try a side 
    
    def side?
      SIDES.detect{|a| @board.cells[a] == " "}
    end  
      
end 
end