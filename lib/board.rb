class Board
    
    attr_accessor :cells
    
    def initialize
        reset!
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
    
    def position(number)
        cell_number = (number.to_i)-1
        return "#{@cells[cell_number]}"
    end
    
    def full?
        cells.all?{|token| token == "X" || token == "O"}
    end
    
    def turn_count
        cells.count{|token| token == "X" || token == "O"}
    end
    
    def taken?(number)
        cell_number = (number.to_i)-1
        cells[cell_number] == 'X' || cells[cell_number] == 'O' ? true : false
        
    end
    
    def valid_move?(number)
        begin
            (1..9).any? {|item| item == number.to_i} && !taken?(number) 
        rescue 
            false
        end
    end
    
    def update(number, player)
        cells[(number.to_i-1)] = player.token
    end
    
end
        
        
        
        
