class Board
    attr_accessor :cells
    def initialize
       @cells = Array.new(9, " ") 
    end

    def reset!
        self.cells.clear
        self.cells = Array.new(9, " ")
    end

    def display
        self.cells.each.with_index(1){|value, index|
            if index % 3 == 0 
                puts " #{value} "
                puts "-----------" unless index == 9
            else
                print " #{value} |"
            end
        }  
    end

    def position(index)
        self.cells[index.to_i - 1]
    end

    def full?
        !self.cells.any?{|index| index == " "}
    end

    def turn_count
        self.cells.count{|value| value != " "}
    end

    def taken?(index)
        self.cells[index.to_i - 1] == " " ? false : true
    end

    def valid_move?(index)
        !taken?(index) if index.to_i.between?(1,9)
    end

    def update(index, player)
        self.cells[index.to_i - 1] = player.token if valid_move?(index)
    end
end