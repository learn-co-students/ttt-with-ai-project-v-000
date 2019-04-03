class Board
    
    attr_accessor :cells

    #sets the cells of the board to a 9 element array of " "
    def initialize 
        self.reset!
    end

    #can reset the state of the cells in the board
    #sets the cells of the board to a 9 element array of " "
    def reset! 
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    #takes input, turns into an integr and subtracts one, uses input as index to return the cell 
    def position(input)
        cells[input.to_i - 1]
    end

    def full?
        cells.all? { |spot| spot == "X" || spot == "O" }
    end

    # returns amount of turns based on cells, integer
    def turn_count
        cells.count {|spot| spot == "X" || spot == "O"}
    end

    # returns true, if X || O, false if "" || " "
    def taken?(input)
        if position(input) == "X" || position(input) == "O"
            true
        elsif position(input) == "" || position(input) == " "
            false
        end
    end

    #true, if input between 1-9 and !taken?
    def valid_move?(input)
        input.to_i.between?(1, 9) && !taken?(input)
    end

    #updates the cell with the token according to the input
    def update(input, player)
        cells[input.to_i - 1] = player.token
    end





end