class Board
attr_accessor :cells

        def initialize
          @cells = [" "," "," "," "," "," "," "," "," "]
        end


        def reset!
        @cells = Array.new(9, " ")
        #can reset the state of the cells in the board
        # sets the cells of the board to a 9 element array of " "
        end

        def display # prints the board
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
        end


        def position
        #takes in user input and returns the value of the board cell
        end

        def full? #returns true for a full board
          #returns false for an in-progress game
        end

        def turn_count #returns the amount of turns based on cell value
        end

        def taken?
          # returns true if the position is X or O
          # returns false if the position is empty or blank
        end

        def valid_move?
        # returns true for user input between 1-9 that is not taken
        end

        def update
        # updates the cells in the board with the player token according to the input
        end



end #end class
