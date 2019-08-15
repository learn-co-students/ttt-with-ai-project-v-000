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


        def position(input)
        #takes in user input and returns the value of the board cell
         cells[input.to_i-1]
        end

        def full? #returns true for a full board
          #returns false for an in-progress game
            cells.all?{|token| token == "X" || token == "O"}

        end

        def turn_count #returns the amount of turns based on cell value
            cells.count{|token| token == "X" || token == "O"}
        end

        def taken?(input)
          # returns true if the position is X or O
          # returns false if the position is empty or blank
          !(position(input) == " " || position(input) == "")
        end

        def valid_move?(input)
        # returns true for user input between 1-9 that is not taken
            input.to_i.between?(1,9) && !taken?(input)
        end

        def update(input, player)
        # updates the cells in the board with the player token according to the input
          cells[input.to_i-1] = player.token
        end



end #end class
