

module Players
  
  class Computer < Player
    
    attr_accessor :offense, :defense, :comp_token, :opp_token, :board, :win, :block, :combo

    WIN_COMBOS = Game::WIN_COMBINATIONS
    
    def move(board)
      sleep(1)
      identify_tokens
      @board = board.cells
      
      off_and_def_combos
      find_best_move
    end
    
    def identify_tokens
      @comp_token = self.token
      if comp_token == "X"
        @opp_token = "O"
      else
        @opp_token = "X"
      end
    end
      
      
    def randomizer(array)
      ix = rand(0..array.length)
      array[ix]
    end
    
    
    def off_and_def_combos
      @offense = []
      @defense = []
      @combo = []
      @win = nil 
      @block = nil
      
      WIN_COMBOS.each do |combo|
        wc = @board[combo[0]],@board[combo[1]],@board[combo[2]]
        
        if wc.count(comp_token) == 2 && wc.count(opp_token) == 0
          blank = wc.index(" ")
          @win = combo[blank]
          
        elsif wc.count(opp_token) == 2 && wc.count(" ") == 1
          blank = wc.index(" ")
          @block = combo[blank]
          
        elsif wc.all?{|cell| cell == " " || cell == @opp_token }
          wc.each.with_index do |cell, ix| 
            if cell == " "
              @defense << combo[ix]
            end
          end
        
        elsif wc.all?{|cell| cell == " " || cell == @comp_token}
          wc.each.with_index do |cell, ix| 
            if cell == " "
              @offense << combo[ix]
            end
          end
        end
      end
    end

      
    def find_best_move
      
       @offense.each do |i| 
        if @defense.include?(i)
          @combo << i
        end
      end

      if @win != nil
        move = @win
        
      elsif @block != nil
        move = @block
        
      elsif @board.all?{|cell| cell == " "}
        no_5 = @board.uniq.reject{|cell| cell == 4}
        move = randomizer(no_5)
        
      elsif @board.count(@opp_token) == 1 && @board[4] == " "
        move = 4
    
      elsif @combo.length > 0
        move = randomizer(@combo)
        
      elsif @offense.length > 0
        move = randomizer(@offense.uniq)
        
      elsif @defense.length > 0
        move = randomizer(@defense.uniq)
        
      else
        move = @board.index(" ")
        
      end
      
      (move.to_i + 1).to_s
    end
  end
end