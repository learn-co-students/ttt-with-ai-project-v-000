module Players
  class Computer < Player
    
    def move(board)
        move = nil
        msg = "Computer moves to "
       
        if self.player_number == 1
            move = attack_strategy(board)
        elsif self.player_number == 2
            move = defend_strategy(board)
        else
           move = attack_strategy(board)
        end
        
        puts msg + "#{move}."
        move
    end
    
    # If Computer is 1st Player Attack.
    def attack_strategy(board)
        
        # if First, play a corner.
        if board.turn_count == 0
            move = Game::CORNER_MOVES.sample.to_s
        end
        
        # Human Doesn't Play Center, CPU's 2nd turn should be Corner.
        # Corner move here should have (2) CPU tokens in a row, and an empty space between them.
        if board.cells[4] == " " && board.turn_count >= 2
            Game::CORNER_COMBOS.detect do |combo|
                if combo.select { |i| board.position(i+1) == token }.size == 1 && combo.select { |i| board.position(i+1) == " " }.size == 2
                    if board.position(combo[0]+1) == " "
                        move = (combo[0]+1).to_s
                    else
                        move = (combo[2]+1).to_s 
                    end
                end
            end
        end
        
        # On Turn 4 take Center, if it hasn't been done yet.
        if board.turn_count == 4 && board.cells[4] == " "
            if find_or_block_move(board)
                move = find_or_block_move(board)
            else
                move = "5"
            end
        end
        
        # Look for Possible wins in one move or block
        if board.turn_count >= 5
            move = find_or_block_move(board)
        end
       
        # FlowChart if Human Plays Center
        if board.cells[4] == "O" && board.cells[4] != " " && board.turn_count > 0
            
            # If Opponent plays 1st move to Center. Play opposite corner of your first move.
            if board.turn_count == 2
                prev_move = board.cells.index { |i| i == "X" }.to_s
                
                case prev_move
                when "0"
                    move = "9"
                when "2"
                    move = "7"
                when "6"
                    move = "3"
                when "8"
                    move = "1"
                end
            end
            # if Human Takes Corner on 2nd move, take last corner. If not, look for Win | Block.
            if board.turn_count == 4 && Game::CORNER_MOVES.each { |i| board.cells[i-1] == "O"}
                move = Game::CORNER_MOVES.sample.to_s
            elsif board.turn_count == 4  
                move = find_or_block_move(board)
            end
        end
        
        move
    end
    
    
    
    # If Computer is 2nd Player. Defend!
    def defend_strategy(board)
        
        ## Strengthen if Opponent gets 3 corners
            ## Stop him from getting 3 corners
            ## create a defense for it
        
        # On 1st Turn, Take 'Center' if open take it.
        move = "5" if !board.taken?(5) && board.turn_count == 1
        
        # CPU has Center FlowChart.
        if board.cells[4] == token 
            
            # Cpu 2nd move should be a Side Move, unless you need to block
            if board.turn_count == 3 || board.turn_count == 5
                move = find_or_block_move(board)
                move = Game::SIDE_MOVES.sample.to_s  if move == nil
                move
            end
            
            if board.turn_count >= 7
                move = find_or_block_move(board)
            end
            move
        end
        
        # Opponent has Center FlowChart.
        if board.cells[4] != token && board.cells[4] != " "
            
            # First move should be a corner.
            move = Game::CORNER_MOVES.sample.to_s if board.turn_count == 1
            
            # No way to Win unless a mistake is made, just block until tie, or mistake.
            move = find_or_block_move(board) if board.turn_count >= 3
            
        end
        # Final Return
        move
    end
    
    
    # Blocking | Finding Potential Wins, Used by Both Defense and Attack Strategies
    def find_or_block_move(board)
        move = nil
        # Detect returns first which is true
        Game::WIN_COMBINATIONS.each do |combo|
           
           # Find a change to win, so (2) "X" with a remaining " " empty
            # board.position - 1, so add one before passing in.
          if combo.select { |i| board.position(i+1) == token }.size == 2 && combo.select { |i| board.position(i+1) == " "}.size == 1
            num = combo.index { |i| board.cells[i] == " " } 
            move = (combo[num] + 1).to_s
              
            # If no chance of Win, look for (2) "O" with a remaining " " empty and block it
          elsif combo.select { |i| board.position(i+1) != token && board.position(i+1) != " " }.size == 2 && combo.select{ |i| board.position(i+1) == " " }.size == 1
            num = combo.index { |i| board.cells[i] == " " } 
            move = (combo[num] + 1).to_s
          
          end
          
        end
        
          # Find a Move which isn't taken and play it.
            move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil && board.turn_count > 2 && board.turn_count != 4
            
        # return move
        move
    end
    
  end
end
