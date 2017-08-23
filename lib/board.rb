class Board
    attr_accessor :cells
    
    def initialize
        reset!
    end
    
    def reset!
        self.cells = Array.new(9, " ")
    end
    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} \n" 
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} \n"
        puts "-----------"  
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} \n"
    end
    def position(input)
        input = input.to_i - 1
        cells[input]
    end
    def full?
        
        
    end
end                