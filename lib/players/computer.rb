module Players
  class Players::Computer < Player
          def move(board)
    
                    ## add logic:  first move should Always look for the center (5) position
                    # computer should look for a corner position if center is taken
                    # WIN_COMBINATIONS has two of the opponents token on it.. computer should take the third position
                    #
                    #WIN_COMBINATIONS.detect { |x| x.sort; if !self.token == x[0] && x[1] then x[2]; break}
                    #      w_c = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

                    #      w_c.collect.each do |x|
                    #        x.sort
                    #        if board.cells[x[0]] == "X" && board.cells[x[1]] == "X"
                    #          return "#{x[2]}"
                    #          break
                    #        else
                    #          board.cells[4] == " " ? "5" : ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
                    #        end
                    #      end
        board.cells[4] == " " ? "5" : ["1", "2", "3", "4", "6", "7", "8", "9"].sample
                #^^^^^ALWAYS TAKES CENTER CELL^^^^
    end
  end
end
