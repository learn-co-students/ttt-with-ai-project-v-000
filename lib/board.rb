class Board
    attr_accessor :cells, :game
    
    def initialize
       @cells = Array.new(9, " ") 
    end
    
    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "        
    end
    
    def position(input)
      input = input.strip.to_i - 1
      self.cells[input]
    end
    
    def full?
       self.cells.all? {|cell| cell == "X" || cell == "O"} 
    end
    
    def turn_count
       self.cells.count{|cell| cell == "X" || cell == "O"} 
    end
    
    def taken?(input)
       position(input) == "X" || position(input) == "O" 
    end
    
    def valid_move?(input)
       (input.to_i) >= 1 && (input.to_i) <= 9 && !taken?(input)  
    end
    
    def update(input, player)
       self.cells[input.strip.to_i-1] = player.token if valid_move?(input)
    end
    
    def reset!
        self.cells = Array.new(9, " ")
    end
end