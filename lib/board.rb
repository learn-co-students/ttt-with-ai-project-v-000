class Board
    attr_accessor :cells

    def initialize
        self.cells = Array.new
        reset!
    end

    def reset!
        (0..8).each {|n| cells[n] = ' '}
    end

    def display
        display_row 0
        puts "-----------"
        display_row 3
        puts "-----------"
        display_row 6
    end

    def display_row start_cell
        #avoids having to type in this interpolation monstrosity for each row
        puts " #{cells[start_cell]} | #{cells[start_cell + 1]} | #{cells[start_cell + 2]} "
    end

    def position cell_num
       #need to convert to integer and correct for humans thinking 1-9, computer 0-8
       idx = cell_num.to_i - 1
       cells[idx]
    end

    def full?
        !cells.detect{|pos| pos == " "}
    end

    def turn_count
        cells.count {|pos| pos != " "}
    end

    def taken? pos
        idx = pos.to_i - 1
        cells[idx] != " "
    end

    def valid_move? pos
        chosen = pos.to_i
        if chosen < 1 || chosen > 9
            nil
        else
            !taken? pos
        end
    end

    def update(pos, active_player)
        idx = pos.to_i - 1
        cells[idx] = active_player.token
    end

end
