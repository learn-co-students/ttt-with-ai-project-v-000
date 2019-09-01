require 'pry'

class Board

    attr_accessor :cells

    def initialize
        self.reset!
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "------------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "------------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(position_string)
        @cells[position_string.to_i - 1]
    end

    def full?
        !@cells.include?(" ")
    end

    def turn_count
        9 - @cells.count(" ")
    end

    def taken?(position_string)
        !(@cells[position_string.to_i - 1] == " ")
    end

    def valid_move?(position_string)
        if position_string.to_i < 10 && position_string.to_i > 0
            if !taken?(position_string)
                true
            end
        else
            false
        end
    end

    def update(position_string, player)
        @cells[position_string.to_i - 1] = player.token
    end
    
    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

end