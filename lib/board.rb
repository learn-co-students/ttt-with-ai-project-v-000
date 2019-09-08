class Board
    
    attr_accessor :cells
    
    def initialize
        self.reset!
    end
    
    def reset!
        @cells = Array.new(9, " ")
    end
    
    def display
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end
    
    def position(user_input)
        index = user_input.to_i - 1
        self.cells[index]
    end
    
    def update(input, player)
        self.cells[input.to_i - 1] = player.token
    end
    
    
    def full?
        !self.cells.include?(" ")
    end
    
    def turn_count
        counter = 0
        self.cells.each {|x| counter += 1 if x == "X" || x == "O"}
        counter
    end
    
    def taken?(input)
        position(input) != " "
    end
    
    def valid_move?(input)
        self.taken?(input) == false && input.to_i.between?(1, 9) 
    end
end