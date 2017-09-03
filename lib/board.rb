class Board
    attr_accessor :cells
    @cells = [" "," "," "," "," "," "," "," "," "]

    def initialize
        self.reset!
    end 

    def display
        @cells
    end 

    def reset!
        @cells = [" "," "," "," "," "," "," "," "," "]
    end

    def position(str_num)
        @cells[str_num.to_i - 1]
    end 

    def update(position, player)
        @cells[position.to_i - 1] = player.token
    end 

    def full?
        @cells.all? {|i| i == "X" || i == "O" }
    end

    def turn_count
        self.display.count("X") + self.display.count("O")
    end

    def taken?(position)
      !(@cells[(position.to_i) -1].nil? || @cells[(position.to_i) -1] == " ")  
    end

    def valid_move?(position)
        if  position.to_i != 0 && position.to_i <= @cells.length 
            if taken?(position) == false
                true  
            else
                false
            end 
        else
            false
        end        
    end 
end

print "Hello dude!"
