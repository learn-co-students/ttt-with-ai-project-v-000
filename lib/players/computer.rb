
module Players
    class Computer < Player
        attr_accessor :board
  
   

         def move(board)
            move = nil
        corners = [1,3,7,9]

        win_combos = [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [2,4,6]
        
        if !board.taken?(5)
            move = 5
             
        elsif !board.taken?(corners.sample)
             corners.sample.to_s

        # if win_combos.values_at[0,1]

        elsif
            rand(0..8)

            end
        end

    end
    

         # board.cells.values_at[0,1]
            


          #WIN_COMBINATIONS.each do
               
# Use select or reject if you need to select or reject items based on a condition.
# Use collect if you need to build an array of the results from logic in the block.
# Use inject if you need to accumulate, total, or concatenate array values together.
# Use detect if you need to find an item in an array.
            
            
            
end
        #board.cells.each_index.select {|i| board.cells[i] == " "}.join(",")
      
      
       #rand(0..8)
    #    def computer_taken?()

    #     #strategy - iterate of the cells array to find the empty spaces then 
    #     #array[input] = token --> to update an array (or tic tac toe board)
    #     #find the index of the empty spaced
    #     end
    #     end
    
    # def corners
    #     CORNERS.shuffle!
    # end
    
    # def corner
    #     corners.find {|corner|board.cells[corner] == " "}
    # end
    




