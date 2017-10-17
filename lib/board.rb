class Board
    attr_accessor :cells
    @cells = [" "," "," "," "," "," "," "," "," "]

    def initialize
        self.reset!
    end

    def display
      puts " #{@cells[0]} " "|" " #{@cells[1]} " "|" " #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} " "|" " #{@cells[4]} " "|" " #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} " "|" " #{@cells[7]} " "|" " #{@cells[8]} "
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
        self.cells.count("X") + self.cells.count("O")
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
