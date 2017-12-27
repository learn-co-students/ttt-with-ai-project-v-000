module Players
    class Computer < Player
        include Matchable
        
        attr_accessor :token
        
        def initialize(token)
           self.token = token 
        end
        
    
        def move(board)
            # board.cells = ["X","X", " ", " ", " ", " ", " ", " ", " "]   ##for testing
            x = almost_won?(board)
            
            ## if the next move will be a winning move do that else move to block current player's two in a row
          if x != false
              n = x.detect {|i| board.cells[i] == " "}
              n += 1
              return n.to_s
              
              ##if no almost_won move exists randomely pick a spot to play
              ##this can be improved to choose a spot with strategy instead of randomness
          else
            (1..9).to_a.sample.to_s
          end
        end 
        
        ##AI Methods  
        ##refactor to clean up
        
        ##check to see if there is a move for either player that will cause a win.
        ##find a way to get rid of the return in the loop
        def almost_won?(board)
            maybe_move = false
            
            Game::WIN_COMBINATIONS.each do |combo| 
              
              c = combo_match(combo, board)
              return combo if c == self.token
              maybe_move = combo if c != false
            
            end
          maybe_move
        end
        
        
        ##check if two spots on a combo are taken and the same. Returns the index if there are two tokens in a row else false
        def combo_match(combo, board)
            toreturn = false
            
            #initially checks that there is a valid move available in the winning combo
            if !combo.none? {|i| board.cells[i] == " "}

                if match_two_or(board, combo[0], combo[1], combo[2]) && board.cells[combo[0]] != " "
                    toreturn = board.cells[combo[0]]
              
                elsif match_two_or(board, combo[1], combo[2], combo[0]) && board.cells[combo[1]] != " "
                    toreturn = board.cells[combo[1]]
                end

            end
            toreturn
        end
    end
end