class Board
    
    attr_accessor :cells
    
    def initialize
       reset!
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
        puts "\n"
    end
    
    def position(input)
        input = input.chomp.to_i - 1
        cells[input]
    end
    
    def full?
        !cells.include?(" ")
    end
    
    def turn_count
        a = cells.grep (/x|o/i)
        a.size
    end
    
    def taken?(loc)
        position(loc) == " " ? false : true
    end
    
    def valid_move?(input)
        # binding.pry
        !taken?(input) && input.to_i < 10 && input.to_i > 0
    end
    
    def update(loc, player)
       cells[loc.to_i - 1] = player.token if valid_move?(loc)
    end
end