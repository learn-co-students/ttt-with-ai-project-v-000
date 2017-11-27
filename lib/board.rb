require 'pry'

class Board

    attr_accessor :cells

    def cells=(cells)
        @cells = cells
    end

    def reset!
        @cells.clear
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def initialize
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(input)
        cells[input.to_i-1]
    end

    def full?
        @cells.all? { |cell| cell !=  " " }
    end

    def turn_count
        counter = 0
        while @cells.each do |cell| cell !=  " "
        counter +=1
    end

end
