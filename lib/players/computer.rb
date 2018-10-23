module Players
    class Computer < Player
        
        # #move
        #selects a random number between 1 - 9, not 0 - 8.
        def move(position)
            position = rand(1..9).to_s
            until valid_move?(input)

            end
            
        end
    end   
end

# def move(board)
      
      #def empty?
        #cells.all?{|token| token != "X" && token != "O"}
     # end

# if empty?
#    position = "5" (takes middle position if the board is empty)
# elsif board.valid_move?(1, 3, 7, 9) 
#    position = "1" || position = "3" || position = "7" || position = "9" (checks corners)

#Somehow check to see if the WIN_COMBINATIONS has two of the same token and choose the third space as the next move? 
#WIN_COMBINATIONS.detect do |combo|
#    @board[combo[0]] == @board[combo[1]] &&
#    @board[combo[1]] == @board[combo[2]] &&
#    position_taken?(combo[0])
