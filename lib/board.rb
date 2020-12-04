class Board

    attr_accessor :cells

    def initialize
        self.reset!
    end

    def reset!
        self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def position(input)
        self.cells[input.to_i - 1]
    end

    def full?
        return !cells.any?(/ /)
    end

    def turn_count
        self.cells.count{|x| x == "X" || x == "O"}
    end

    def taken?(input)
        position(input) == "X" || position(input) == "O"
    end

    def valid_move?(input)
        int = input.to_i
        int <= 9 && int >= 1 && !taken?(input)  
    end

    def update(input, player)
        self.cells[input.to_i - 1] = player.token
    end

end