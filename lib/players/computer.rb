

module Players
  
  class Computer < Player
    
    attr_accessor :offense, :comp_token, :opp_token, :board
    
    WIN_COMBOS = Game::WIN_COMBINATIONS
    
    def move(board)
      identify_tokens
      @board = board.cells
      
      if @board.all?{|cell| cell == " "}
        "5"
      else 
        win_combos
      end
      
    end
    
    
    def identify_tokens
      @comp_token = self.token
      if comp_token == "X"
        @opp_token = "O"
      else
        @opp_token = "X"
      end
    end
      
    
    def win_combos
      offense = []
      defense = []
      win = nil
      block = nil
      
      WIN_COMBOS.each do |combo|
        wc = @board[combo[0]],@board[combo[1]],@board[combo[2]]
        
        if wc.count(@comp_token) == 2 
          win = wc.index(" ").to_s

        elsif wc.count(@opp_token) == 2 
          block = wc.index(" ").to_s
          
        elsif wc.none?{|cell| cell == @opp_token}
          offense << combo.select{|cell| cell == " "}
          
        elsif wc.none?{|cell| cell == @comp_token}
          defense << combo.select{|cell| cell == " "}
        end
      end
      
      if win
        return win
      elsif block
        return block
      else 
        off_and_def = offense.flatten & defense.flatten
        return rand(1..off_and_def.length + 1).to_s
      end
    end
    
    
  end
end