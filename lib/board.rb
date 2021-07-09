require 'pry'

class Board 
    attr_accessor :cells

     #---INITIALIZE-------
      # every new board is reset to an empty one. 
    def initialize
        reset!
    end
    
     #----RESET----------
     # resets the cells of the board to a 9 element array of 9 empty cells
    def reset! 
        @cells = Array.new(9, " ")
    end

    #----DISPLAY----------
    # prints the board's current state
    def display
        puts "CURRENT STATE OF BOARD"
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
        puts "\n"
    end
    
     #----POSITION----------
     # convert user input from a string to an integer and subtract 1 to account for user and computer difference for first position.
    def position(input) 
        cells[input.to_i-1]
    end

    #----FULL---------------
    # returns true for a full board and false for an game in-progress 
    def full?
        cells.all?{|token| token == "X" || token == "O"}
      end

     #---COUNT------------
     # counts the cells containing X's and O's.
    def turn_count 
        cells.count{|char| char == "X" || char == "O" }
    end
    
     #---TAKEN-------------
     #returns true if the position is X or O. Uses #position.
    def taken?(input) 
        if position(input) == "X" || position(input) == "O"
            true
        else
            false
        end
    end

    #---VALID_MOVE?--------
     # returns 'true'if choice is between 1-9 && if cell !#taken?
    def valid_move?(input)
        input.to_i.between?(1,9) && !taken?(input)
    end
    
    #----UPDATE----------------
     # updates board with the player's token
    def update(input, player)
        cells[input.to_i-1] = player.token #stands for either X or O
    end
end