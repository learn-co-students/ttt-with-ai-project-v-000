class Board
    attr_accessor :cells
    
    def initialize
        reset! # starts board with cells for a new game
    end

    def reset! # resets the state of cells to what a board should look like at the start of a game.
        @cells = [" "," "," "," "," "," "," "," "," "]
    end

    def display # prints board current state
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} " 
    end

    def position(input) # position taken from user input
        input = input.to_i
        cells[input - 1]
    end

    def update(input, player) # updates board when player makes a move
        input = input.to_i
        cells[input -1] = player.token
    end
    
    # Board States
    def full?
        cells.none? {|cell| cell == " " || cell == nil}
    end

    def turn_count
        cells.count {|cell| cell == "X" || cell == "O"}
    end

    def taken?(input)
        position(input) == "X" || position(input) == "O"
    end

    def valid_move?(input)
        input = input.to_i
        !(taken?(input)) && input.between?(1, 9)
    end

end