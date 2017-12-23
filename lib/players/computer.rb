module Players
    class Computer < Player
    
        attr_accessor :token
        
        def initialize(token)
           self.token = token 
        end
        
    
        def move(board)
            # board.cells = ["X","X", " ", " ", " ", " ", " ", " ", " "]
            x = almost_won?(board)
          if x != nil
              n = x.detect {|i| board.cells[i] == " "}
              n += 1
               
              return n.to_s
          else
            n = (1..9).to_a.sample.to_s
            n
            end
        end 
        
        ##AI Methods  
        ##refactor to look pretty later
        def almost_won?(board)
            maybe_move = nil
            Game::WIN_COMBINATIONS.each do |combo| 
              c = match_two(combo, board)
              if c == self.token
                  return combo
              end
              if c != nil
                  maybe_move = combo
              end
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