class Board
    attr_accessor :cells

    def initialize
        self.cells = Array.new(9, " ")
    end

    def reset!
        self.cells = Array.new(9, " ")
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(input)
        self.cells[input.to_i-1]
    end

    def full?
        self.cells.none?{|c| c == ' '} ? true : false
    end

    def turn_count
        self.cells.select{|c| c != ' '}.size
    end

    def taken?(input)
        position(input) != ' '
    end

    def valid_move?(input)
        input.to_i.between?(1, 9) && !taken?(input)
    end

    def update(input, player)
        self.cells[input.to_i-1] = player.token
    end
end 