module Players
    class Computer < Player
    
        attr_accessor :token
        
        def initialize(token)
           self.token = token 
        end
        
    
        def move(board)
            # board.cells = ["X","X", " ", " ", " ", " ", " ", " ", " "]
            x = almost_won?(board)
            
            ## if the next move will be a winning move do that else move to block current player's two in a row
          if x != nil
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
        ##refactor to look pretty  and use higher order methods later
        
        ##check to see if there is a move for either player that will cause a win.
        def almost_won?(board)
            maybe_move = nil
            Game::WIN_COMBINATIONS.each do |combo| 
              c = match_two(combo, board)
              return combo if c == self.token
              maybe_move = combo if c != nil
          end
          maybe_move
        end
        
        ##check if two spots on a combo are taken and the same
        def match_two(combo, board)
            toreturn = nil
          return nil if board.cells[combo[0]] != " " && board.cells[combo[1]] != " " && board.cells[combo[2]] != " "
          if board.cells[combo[0]] != " " && (board.cells[combo[0]] == board.cells[combo[1]] || board.cells[combo[0]] == board.cells[combo[2]])
            toreturn = board.cells[combo[0]]
          end
          if board.cells[combo[1]] != " " && (board.cells[combo[2]] == board.cells[combo[1]])
            toreturn = board.cells[combo[1]]
          end
         toreturn
        end

    end
end