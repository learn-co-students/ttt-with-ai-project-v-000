class Board
    
    attr_reader :cells

    def initialize
        @cells = cells
        # binding.pry
        self.cells = reset!
    end

    def cells=(cells)
        @cells = cells.to_a
    end
    
    def reset!
        # @cells.clear
        @cells = Array.new(9, " ")
    end

    def display
        binding.pry
        puts self.cells
    end

    def position
        #input = gets.strip 

    end

    def full?

    end

    def turn_count

    end

    def taken?

    end

    def valid_move?

    end

    def update

    end





end