class Board
    attr_accessor :cells
    
    def initialize
        @cells = Array.new(9, " ")
    end
    
    def reset!
        @cells = [" "," "," "," "," "," "," "," "," "]
    end
    
    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-" * 11
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-" * 11
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "   
    end
    
    def position(i)
        i = i.to_i - 1 
        self.cells[i]
    end
    
    def full?
        self.cells.none? {|c| c == " "}  
    end 
    
    def empty?
       self.cells.all? {|c| c == " "}  
    end
    
    def turn_count
        self.cells.count {|c| c == "X" || c == "O"}   
    end
    
    def taken?(move)
        position(move) != " "
    end
    
    def valid_move?(move)
        move.to_i.between?(1, 9) && !self.taken?(move)
    end
    
    def update(i, player)
        self.cells[i.to_i - 1] = player.token unless taken?(i)
    end
    
end