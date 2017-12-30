class Board
    CENTER = ["5"]
    CORNERS = ["1", "3", "7", "9"]
    SIDES = ["2", "4", "6", "8"]

    attr_accessor :cells

    def initialize
        self.reset!
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        line = ""
        index = 0
        board_size = @cells.size
        while index < board_size do
            line << " " << @cells[index] << " "

            if (0 == (index + 1) % 3)
                puts line
                line.clear
                if (index + 1 < board_size) 
                    puts build_repeated_sequence_string('-', 11)
                end
            else
                line << "|"
            end

            index+=1
        end
    end

    def position(position_string)
        if !(legal_move?(position_string))
            "OOPS: Illegal move"
        else
            @cells[position_string.to_i - 1]
        end
    end

    def full?
        @cells.all? {|cell| " " != cell}
    end

    def turn_count
        @cells.count {|cell| " " != cell}
    end

    def get_empty(cells)
        cells.detect {|cell| !self.taken?(cell)}
    end

    def taken?(position_string)
        ("X" == position(position_string) || "O" == position(position_string))
    end

    def valid_move?(position_string)
        legal_move?(position_string) && !taken?(position_string)
    end

    def update(position_string, player)
        @cells[position_string.to_i - 1] = player.token
    end

    # utility methods
    def build_repeated_sequence_string(sequence, repetitions)
        sequence_string = ""
        repetitions.times {sequence_string << sequence}
        sequence_string
    end

    def legal_move?(position_string)
        position = position_string.to_i - 1
        position >= 0 && position < 9
    end
end