class Board
    attr_accessor :cells
    
    def initialize
        reset!
    end
    
    def reset!
        self.cells = Array.new(9, " ")
    end
    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n" 
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n"
        puts "-----------"  
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} \n"
    end
    def position(input)
        input = input.to_i - 1
        @cells[input]
    end
    def full?
        cells.all? { |c|  c == "O" || c == "X"  }  
    end
    def turn_count
        cells.count{ |e|  e == "O" || e == "X"  }
    end
    def taken?(index)
        index = index.to_i - 1
        !(@cells[index].nil? || @cells[index] == " ")
    end
    def valid_move?(index)

        if index.to_i >=1 && index.to_i <= 9 
            !(taken?(index)) 
        end    
    end

end                
