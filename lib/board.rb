class Board
    attr_accessor:cells
    
    def initialize
        self.reset!
    end
    
    def reset!
        @cells = Array.new(9, " ")
    end
    
    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end
    
    def index(input)
        input.to_i - 1
    end
    
    def position(input)
        @cells[self.index(input)]
    end
    
    def full?
        !@cells.include?(" ") ? true : false
    end
    
    def turn_count
        @cells.count {|cell| cell != " "}
    end
    
    def taken?(input)
        cell_value = position(input)
        cell_value == " " ? false : true
    end
    
    def valid_move?(input)
        if input.to_i.between?(1, 9) && !taken?(input)
            true
        else
            false
        end
    end
    
    def update(input, player)
        @cells[self.index(input)] = player.token
    end
        
end