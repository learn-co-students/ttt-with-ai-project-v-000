class Board
    attr_accessor :cells

   
   
    def reset! #resets the @cells which empties the board
        @cells=[" "," "," "," "," "," "," "," "," "]
    end
    
   def cells #is the board 
       @cells
   end
   
   def initialize # resets and creates a new board for a new game
      self.reset!
   end
   
   def display #displays the board currently in cells
    print " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n"
    print "-----------\n"
    print " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n"
    print "-----------\n"
    print " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
   end
   
   def position (input) #returns the contents of the selected cell
       return @cells[input.to_i-1]
   end
   
   def full? #determines if the board is full
      !@cells.include?(" ") 
   end
   
   def turn_count #returns the amount of turns in the game
      array_of_empty_cells=@cells.select {|cell| cell!=" "}
      return array_of_empty_cells.size
   end
   
   def taken? (input) #determines of the input cell (changed) is already taken or not
     input=input.to_i-1
     if @cells[input]!=" "
         return true
     else
         return false
     end
   end
   
   def valid_move? (input) #determines if a given number is a valid number and if the position is taken
    new_input=input.split #turns the input into an array
    if new_input.all? {|num|num.to_i>0 && num.to_i<10} #uses all? to test if the input is a valid number
    
    else
        return false #is the catch for invalid input
    end
    
    !taken?(input) #reverse the response of taken to determine if it is a valid move
   end
   
   def update(input, player) #updates the @cells to the token of the player
      @cells[input.to_i-1]=player.token
   end
     
end